#include"funzioni.h"

void disable_echo_mode(struct termios *old_termios) {
    struct termios new_termios;
    tcgetattr(STDIN_FILENO, old_termios); 
    new_termios = *old_termios;
    new_termios.c_lflag &= ~ECHO;         
    tcsetattr(STDIN_FILENO, TCSANOW, &new_termios); 
}

void enable_echo_mode(const struct termios *old_termios) {
    tcsetattr(STDIN_FILENO, TCSANOW, old_termios); 
}

void stampa(char **st, int numC) {
  int righe = (numC + 2) / 3; 

  for (int r = 0; r < righe; r++) {
      for (int c = 0; c < 3; c++) {
          int indice = r + c * righe;
          if (indice < numC) {
              printf("%-3d) %-25s", indice + 1, st[indice]);
          } else {
              printf("%-28s", ""); 
          }
      }
      printf("\n");
  }
}

void listaQuer() {
  printf("1) Mostra le opere costose di una mostra\n");
  printf("2) Mostra il responsabile con il maggior numero di restauri\n");
  printf("3) Mostra l'ente con il maggior numero di collaborazioni\n");
  printf("4) Mostra le mostre con almeno due artisti\n");
  printf("5) Mostra le opere di una mostra in una zona\n");
}

void stampaElenco() {
  printf("\nLISTA DELLE OPERAZIONI\n");
  listaQuer();
}

void printQuery(PGresult *res) {
  const int tuple = PQntuples(res);
  const int campi = PQnfields(res);
  char v[tuple + 1][campi][256];

  for (int i = 0; i < campi; ++i) {
    strncpy(v[0][i], PQfname(res, i), 256);
  }

  if (tuple == 0) {
    printf("\nRecord not found.\n"); 
    return;
  }
  for (int i = 0; i < tuple; ++i) {
    for (int j = 0; j < campi; ++j) {
      if (strcmp(PQgetvalue(res, i, j), "t") == 0 || 
          strcmp(PQgetvalue(res, i, j), "f") == 0) { 
        if (strcmp(PQgetvalue(res, i, j), "t") == 0) { 
          strncpy(v[i + 1][j], "si", 256); 
        } else {
          strncpy(v[i + 1][j], "no", 256); 
        }
      } else {
        strncpy(v[i + 1][j], PQgetvalue(res, i, j), 256);
      }
    }
  }

  int maxChar[campi]; 
  for (int i = 0; i < campi; ++i) {
    maxChar[i] = 0;
  }

  for (int i = 0; i < campi; ++i) {
    for (int j = 0; j < tuple + 1; ++j) {
      int size = strlen(v[j][i]);
      if (size > maxChar[i]) {
        maxChar[i] = size;
      }
    }
  }

  for (int i = 0; i < campi; ++i) {
    printf("%-*s|", maxChar[i] + 1, v[0][i]); 
  }
  printf("\n");

  for (int i = 0; i < campi; ++i) {
    for (int j = 0; j < maxChar[i] + 1; ++j)
      printf("."); 
                   
    printf("|");   
  }
  printf("\n");
  for (int i = 0; i < tuple; ++i) {
    for (int j = 0; j < campi; ++j) {
      printf("%-*s|", maxChar[j] + 1, v[i + 1][j]);
    }
    printf("\n");
  }
}

int checkConnesione(PGconn *c) {
  if (PQstatus(c) != CONNECTION_OK) {
    fprintf(stderr, "Connessione non avvenuta...: %s\n", PQerrorMessage(c));
    PQfinish(c);
    return 1;
  }
  return 0;
}

int check(PGresult *P, PGconn *c) {
  if (PQresultStatus(P) != PGRES_TUPLES_OK) {
    fprintf(stderr, "Query fallita...: %s\n", PQerrorMessage(c));
    PQclear(P);
    return 1;
  }
  return 0;
}

void query1(PGconn *conn) {
  char *stringa[] = {
      "Impressionismo","Arte Moderna","Arte Contemporanea","Rinascimento Italiano","Surrealismo","Sculture Classiche","Installazioni Interattive","Dermatologia","Arte Concettuale"
    };
  int n = sizeof(stringa) / sizeof(stringa[0]);
  char scelta[32];
  int valore;
  printf("Seleziona la mostra\n");
  stampa(stringa,n);
  printf("\n->");
  scanf("%d",&valore);
  while (getchar() != '\n' && getchar() != EOF);

  while(valore < 1 || valore > 9){
    printf("Seleziona la mostra(1 - 9)\n");
    stampa(stringa,n);
    printf("\n->");
    scanf("%d",&valore);
    while (getchar() != '\n' && getchar() != EOF);
  }

  if (valore == 1)
    strcpy(scelta,"Impressionismo");
  else if (valore == 2)
    strcpy(scelta,"Arte Moderna");
  else if (valore == 3)
    strcpy(scelta,"Arte Contemporanea");
  else if (valore == 4)
    strcpy(scelta,"Rinascimento Italiano");
  else if (valore == 5)
    strcpy(scelta,"Surrealismo");
  else if (valore == 6)
    strcpy(scelta,"Sculture Classiche");
  else if (valore == 7)
    strcpy(scelta,"Installazioni Interattive");
  else if (valore == 8)
    strcpy(scelta,"Dermatologia");
  else if (valore == 9)
    strcpy(scelta,"Arte Concettuale");

  const char *paramValues[1];
  paramValues[0] = scelta;

    const char *query = 
    "WITH opera_costosa AS ( "
        "SELECT DISTINCT O1.nome_opera, O1.valore_di_mercato, O1.artista "
        "FROM Opere O1, Opere O2 "
      "WHERE O1.nome_opera != O2.nome_opera AND O1.mostra = $1 "
    ") "

    "SELECT DISTINCT ON (OC.nome_opera) "
        "OC.nome_opera, " 
        "OC.valore_di_mercato, "
        "OC.artista, "
        "'Quadro' AS tipo_opera, "
        "Q.base || ', ' || Q.tecnica || ', ' || Q.dimensione AS dettagli_opera "
    "FROM opera_costosa OC "
    "JOIN Quadro Q ON OC.nome_opera = Q.nome_quadro "

    "UNION ALL "

    "SELECT DISTINCT ON (OC.nome_opera) "
        "OC.nome_opera, "
        "OC.valore_di_mercato, "
        "OC.artista, "
        "'Scultura' AS tipo_opera, "
        "S.dimensioni || ', ' || S.materiale || ', ' || S.tecnica_scultorea AS dettagli_opera "
    "FROM opera_costosa OC "
    "JOIN Scultura S ON OC.nome_opera = S.nome_scultura "

    "UNION ALL "

    "SELECT DISTINCT ON (OC.nome_opera) "
        "OC.nome_opera, " 
        "OC.valore_di_mercato, "
        "OC.artista, "
        "'Installazione' AS tipo_opera, "
        "I.coinvolgimento_sensoriale || ', ' || I.interattività AS dettagli_opera "
    "FROM opera_costosa OC "
    "JOIN Installazione I ON OC.nome_opera = I.nome_installazione "

    "UNION ALL "

    "SELECT DISTINCT ON (OC.nome_opera) "
        "OC.nome_opera, " 
        "OC.valore_di_mercato," 
        "OC.artista, "
        "'Concettuale' AS tipo_opera, "
        "C.medium_utilizzato || ', ' || C.partecipazione_pubblico AS dettagli_opera "
    "FROM opera_costosa OC "
    "JOIN Concettuale C ON OC.nome_opera = C.nome_opera_concettuale; ";

  PGresult *res = PQexecParams(conn, query, 1, NULL, paramValues, NULL, NULL, 0);
  if (check(res, conn) == 1) {
    return;
  }
  printQuery(res);
  PQclear(res);
}

void query2(PGconn *conn){

  printf("Inserisci il livello di degradazione\n");
  int livello;
  printf("->");
  scanf("%d",&livello);
  while (getchar() != '\n' && getchar() != EOF);
  while(livello < 1 || livello > 5){
    printf("Inserisci il livello di degradazione(1 - 5)\n");
    printf("->");
    scanf("%d",&livello);
    while (getchar() != '\n' && getchar() != EOF);
  }

  const char *paramValues[1];
  char livelloStr[12];
  sprintf(livelloStr, "%d", livello);
  paramValues[0] = livelloStr;

  const char* query = 
  "WITH restauri_per_responsabile AS ( "     
    "SELECT responsabile, COUNT(*) AS Nrestauri "
    "FROM Restauri "
    "WHERE livello_degradazione >= $1 " 
   "GROUP BY responsabile "
  ") "

  "SELECT responsabile, Nrestauri "
  "FROM restauri_per_responsabile "
  "WHERE Nrestauri = (SELECT MAX(Nrestauri) "
                    "FROM restauri_per_responsabile); ";
  
  PGresult *res = PQexecParams(conn, query, 1, NULL, paramValues, NULL, NULL, 0);
  if (check(res, conn) == 1) {
    return;
  }
  printQuery(res);
  PQclear(res);
}

void query3(PGconn *conn){

  char *stringa[] = {
    "pubblico","privato"
  };

  int n = sizeof(stringa) / sizeof(stringa[0]);
  char scelta[32];
  int valore;
  printf("Seleziona il tipo di ente\n");
  stampa(stringa,n);
  printf("\n->");
  scanf("%d",&valore);
  while (getchar() != '\n' && getchar() != EOF);
  while(valore < 1 || valore > 2){
    printf("Seleziona il tipo di ente(1 - 2)\n");
    stampa(stringa,n);
    printf("\n->");
    scanf("%d",&valore);
    while (getchar() != '\n' && getchar() != EOF);
  }

  if (valore == 1)
    strcpy(scelta,"TRUE");
  else if (valore == 2)
    strcpy(scelta,"FALSE");

  const char *paramValues[1];
  paramValues[0] = scelta;

  const char *querty =
  "WITH collaborazioni_mostre AS ( "
    "SELECT ente_di_collaborazione, COUNT(*) AS com "
    "FROM Collaborazioni_Mostre_temporanee CM, Collaborazioni C "
    "WHERE C.ente = CM.ente_di_collaborazione AND C.Pubblico = $1 "
    "GROUP BY ente_di_collaborazione "
  "), "
    "collaborazioni_restauri AS( "
        "SELECT ente_collaborante, COUNT(*) AS cor "
        "FROM Restauri R, Collaborazioni C "
        "WHERE C.Pubblico = TRUE AND R.ente_collaborante = C.ente "
        "GROUP BY ente_collaborante "
    "), "

    "collab_totali AS( "
        "SELECT ente_collaborante, SUM(com + cor) AS totc "
        "FROM collaborazioni_mostre CM, collaborazioni_restauri CR "
        "WHERE CM.ente_di_collaborazione = CR.ente_collaborante "
		"GROUP BY ente_collaborante "
    ") "

  "SELECT ente_collaborante, totc "
  "FROM collab_totali "
  "WHERE totc = (SELECT MAX(totc) "
                "FROM collab_totali); ";

PGresult *res = PQexecParams(conn, querty, 1, NULL, paramValues, NULL, NULL, 0);
if (check(res, conn) == 1) {
  return;
}
printQuery(res);
PQclear(res);
}

void query4(PGconn *conn){
  const char *query =
  "SELECT o.mostra, COUNT(DISTINCT a.pseudonimo) AS numero_artisti_coinvolti "
  "FROM Opere o "
  "JOIN Artisti a ON o.artista = a.pseudonimo "
  "WHERE o.mostra IS NOT NULL "
  "GROUP BY o.mostra "
  "HAVING COUNT(DISTINCT a.pseudonimo) >= 2 "
  "ORDER BY numero_artisti_coinvolti DESC; ";

  PGresult *res = PQexec(conn, query);
  if (check(res, conn) == 1) {
    return;
  }
  printQuery(res);
  PQclear(res);
}

void query5(PGconn *conn){

  char *stringa[] = {
    "Est","Ovest","Nord","Sud","Centrale"
  };
int n = sizeof(stringa) / sizeof(stringa[0]);
char scelta[32];
int valore;
printf("Seleziona l'ala\n");
stampa(stringa,n);
printf("\n->");
scanf("%d",&valore);
while (getchar() != '\n' && getchar() != EOF);

while(valore < 1 || valore > 5){
  printf("Seleziona l'ala(1 - 5)\n");
  stampa(stringa,n);
  printf("\n->");
  scanf("%d",&valore);
  while (getchar() != '\n' && getchar() != EOF);
}

if (valore == 1)
  strcpy(scelta,"Est");
else if (valore == 2)
  strcpy(scelta,"Ovest");
else if (valore == 3)
  strcpy(scelta,"Nord");
else if (valore == 4)
  strcpy(scelta,"Sud");
else if (valore == 5)
  strcpy(scelta,"Centrale");

const char *paramValues[1];
paramValues[0] = scelta;

  const char *query = 
  "WITH opere_per_mostra AS ( "
    "SELECT mostra, COUNT(*) AS opm "
    "FROM Opere "
    "GROUP BY mostra "
  ") "

"SELECT nome_zona, mostra, opm "
"FROM Zone_ Z, opere_per_mostra OM, Mostre M "
"WHERE M.zona = Z.nome_zona AND OM.mostra = M.nome_mostra AND Z.ala = $1; ";

PGresult *res = PQexecParams(conn, query, 1, NULL, paramValues, NULL, NULL, 0);
if (check(res, conn) == 1) {
  return;
}
printQuery(res);
PQclear(res);
}
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

}

void listaQuer() {
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

void query1(PGconn *c) {
  const char *query = "SELECT * FROM Artisti; ";
  PGresult *res = PQexec(c, query);
  if (check(res,c) == 1)
    return;
  printQuery(res);
  PQclear(res);
}

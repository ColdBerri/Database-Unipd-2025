DROP TABLE IF EXISTS Opere CASCADE;
DROP TABLE IF EXISTS Quadro CASCADE;
DROP TABLE IF EXISTS Scultura CASCADE;
DROP TABLE IF EXISTS Installazione CASCADE;
DROP TABLE IF EXISTS Concettuale CASCADE;
DROP TABLE IF EXISTS Artisti CASCADE;
DROP TABLE IF EXISTS Collaborazioni CASCADE;
DROP TABLE IF EXISTS Mostre CASCADE;
DROP TABLE IF EXISTS Mostre_Temporanee CASCADE;
DROP TABLE IF EXISTS Restauri CASCADE;
DROP TABLE IF EXISTS Laboratori CASCADE;
DROP TABLE IF EXISTS Responsabili;
DROP TABLE IF EXISTS Zone_ CASCADE;
DROP TABLE IF EXISTS Collaborazioni_Mostre_temporanee;
 

CREATE TABLE IF NOT EXISTS Artisti(
    pseudonimo VARCHAR(64) PRIMARY KEY,
    nome VARCHAR(32),
    cognome VARCHAR(32),
    nazionalità VARCHAR(64) NOT NULL,
    sesso VARCHAR(64) NOT NULL,
    data_di_nascita VARCHAR(64) NOT NULL,
    data_di_morte VARCHAR(64)
);

CREATE TABLE IF NOT EXISTS Collaborazioni(
    ente VARCHAR(32) PRIMARY KEY,
    tipo VARCHAR(64) NOT NULL,
    pubblico BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Responsabili(
    codice_fiscale VARCHAR(16) PRIMARY KEY,
    livello INT NOT NULL,
    CHECK(livello BETWEEN 1 AND 5)
);

CREATE TABLE IF NOT EXISTS Zone_ (
    nome_zona VARCHAR(64) PRIMARY KEY,
    ala VARCHAR(64) NOT NULL,
    piano INT NOT NULL,
    responsabile VARCHAR(16) NOT NULL,
    FOREIGN KEY (responsabile) REFERENCES Responsabili(codice_fiscale)
);

CREATE TABLE IF NOT EXISTS Mostre(
    nome_mostra VARCHAR(64) PRIMARY KEY,
    tema VARCHAR(64) NOT NULL,
    zona VARCHAR(64) NOT NULL,
    FOREIGN KEY (zona) REFERENCES Zone_(nome_zona)
);

CREATE TABLE IF NOT EXISTS Mostre_Temporanee(
    nome_mostra VARCHAR(64) PRIMARY KEY,
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    FOREIGN KEY (nome_mostra) REFERENCES Mostre(nome_mostra)
);

CREATE TABLE IF NOT EXISTS Opere(
    nome_opera VARCHAR(64) PRIMARY KEY,
    artista VARCHAR(64) NOT NULL,
    anno_creazione INT NOT NULL,
    valore_di_mercato INT NOT NULL,
    corrente_artistica VARCHAR(64) NOT NULL,
    messaggio TEXT NOT NULL,
    mostra VARCHAR(64),
    FOREIGN KEY (artista) REFERENCES Artisti(pseudonimo),
    FOREIGN KEY (mostra) REFERENCES MOSTRE 
);

CREATE TABLE IF NOT EXISTS Quadro(
    nome_quadro VARCHAR(64) PRIMARY KEY,
    base VARCHAR(32) NOT NULL,
    dimensione VARCHAR(64) NOT NULL,
    tecnica VARCHAR(64) NOT NULL,
    FOREIGN KEY (nome_quadro) REFERENCES Opere(nome_opera)
);

CREATE TABLE IF NOT EXISTS Scultura(
    nome_scultura VARCHAR(64) PRIMARY KEY,
    dimensioni VARCHAR(64) NOT NULL,
    tecnica_scultorea VARCHAR(64) NOT NULL,
    materiale VARCHAR(64) NOT NULL,
    FOREIGN KEY (nome_scultura) REFERENCES Opere(nome_opera)
);

CREATE TABLE IF NOT EXISTS Installazione(
    nome_installazione VARCHAR(64) PRIMARY KEY,
    coinvolgimento_sensoriale VARCHAR(64) NOT NULL,
    interattività VARCHAR(64) NOT NULL,
    FOREIGN KEY (nome_installazione) REFERENCES Opere(nome_opera) 
);

CREATE TABLE IF NOT EXISTS Concettuale(
    nome_opera_concettuale VARCHAR(64) PRIMARY KEY,
    medium_utilizzato VARCHAR(64) NOT NULL,
    partecipazione_pubblico BOOLEAN NOT NULL,
    FOREIGN KEY (nome_opera_concettuale) REFERENCES Opere(nome_opera) 
);

CREATE TABLE IF NOT EXISTS Restauri (
    ID_restauro VARCHAR(64) PRIMARY KEY,
    estreno BOOLEAN NOT NULL,
    ente_collaborante VARCHAR(64),
    livello_degradazione INT NOT NULL,
    FOREIGN KEY (ente_collaborante) REFERENCES Collaborazioni(ente)
);

CREATE TABLE IF NOT EXISTS Laboratori (
    nome_laboratorio VARCHAR(64) PRIMARY KEY,
    ID_restauro VARCHAR(64) NOT NULL,
    numero_di_restauratori INT NOT NULL,
    livello_attrezzatura VARCHAR(64) NOT NULL,
    specializzazione VARCHAR(64) NOT NULL,
    FOREIGN KEY (ID_restauro) REFERENCES Restauri(ID_restauro)
);

CREATE TABLE IF NOT EXISTS Collaborazioni_Mostre_temporanee (
    nome_mostra VARCHAR(64),
    ente_collaborante VARCHAR(64),
    PRIMARY KEY(nome_mostra, ente_collaborante),
    FOREIGN KEY (nome_mostra) REFERENCES Mostre_Temporanee(nome_mostra),
    FOREIGN KEY (ente_collaborante) REFERENCES Collaborazioni(ente)
);


#include "libpq/include/libpq-fe.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>

void listaQuer();
void stampaElenco();
void printQuery(PGresult *);

int checkConnesione(PGconn *);
int check(PGresult *, PGconn *);

void query1(PGconn *);
void query2(PGconn *);
void query3(PGconn *);
void query4(PGconn *);
void query5(PGconn *);

void disable_echo_mode(struct termios*);

void enable_echo_mode(const struct termios*);
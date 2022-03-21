/* Exercice 5
REMARQUE : Il faut faire cette question à la main.
Soit le programme suivant: */
p(X) :- a(X).
p(X) :- b(X), c(X), d(X).
p(X) :- f(X).

a(1).
b(1).
c(1).
b(2).
c(2).
d(2).
f(3).
b(4).
c(4).
d(4).

/* a) Lister l'ensemble des solutions qui seront obtenus à partir de la requête : */
/* ?- p(X). */

/*
p(X) :- a(X).
x = 1

p(X) :- b(X), c(X), d(X).
x = 2
x = 4

p(X) :- f(X).
x = 3
*/
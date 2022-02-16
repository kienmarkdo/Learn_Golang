/*
Exercice 2

Soit la base de faits suivantes :
*/
parent(jack,joe).
parent(jack,karl).
parent(marie,anne).
parent(joe,anne).
parent(marie,paul).
parent(joe,paul).
parent(marie,sylvie).
parent(bruno,sylvie).
parent(anne,zach).
parent(tim,zach).
parent(sam,tim).
parent(emma,tim).
parent(josee,sam).
parent(gilles,sam).

femme(marie).
femme(sylvie).
femme(anne).
femme(emma).
femme(josee).
homme(karl).
homme(jack).
homme(joe).
homme(bruno).
homme(paul).
homme(tim).
homme(zach).
homme(sam).
homme(gilles).

/* Et le prédicat suivant : */
soeur(X, Y) :- parent(Z, X), parent(Z, Y), femme(X).
/* Donner, dans l'ordre, toutes les solutions qui seront produites par le prédicat suivant : */
/* ?- soeur (X,paul). */

/* Brouillon
marie et joe sont les parents de paul.
Donc Z = marie, et Z = joe.

On commence avec Z = marie et Y = paul.
parent(Z,X) donne 2 résultats: anne et sylvie.
Donc X = anne et X = sylvie.
femme(X) est vrai pour les deux cas.
Alors, la prémisse est vraie, donc que la conclusion est également vraie.
Donc, le premier affichage où Z = marie est

soeur(x,paul) = anne
soeur(x,paul) = sylvie

Maintenant, Z = joe et Y = paul.
parent(Z,X) est anne.
Donc X = anne.
femme(X) est vrai.
Comme la prémisse est vraie, la conclusion est également vraie.
Donc, le deuxième affichage est

soeur(x,paul) = anne

Wrong ordering based on the results.
*/

/*
Solution réelle:
?- soeur(X,paul).
X = anne ;
X = anne ;
X = sylvie ;
false.
*/
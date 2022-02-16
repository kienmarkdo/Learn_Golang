/* Exercice 3
Soit les prédicats suivants créés afin de signifier que deux personnes qui combattent le même
ennemi sont des alliés : */
combat(paul,pierre).
combat(jean,simon).
combat(jean,pierre).
allies(X,Y) :- combat(X,Z), combat(Y,Z).
/* Lister dans l'ordre toutes les solutions qui seront trouvées par la requête suivante : */
/* ?- alliés(X,Y).*/

/* Réponse
X = paul, Z = pierre
paul, jean
jean, paul
*/

/* Résultats réelles
?- allies(X,Y).
X = Y, Y = paul ;
X = paul,
Y = jean ;
X = Y, Y = jean ;
X = jean,
Y = paul ;
X = Y, Y = jean.
*/
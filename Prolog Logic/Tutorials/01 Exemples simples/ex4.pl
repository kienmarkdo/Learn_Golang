/* Exercice 4
Soit une base de faits des personnes qui se connaissent mutuellement : */
connaitre(robert,stan).
connaitre(robert,hugo).
connaitre(sara,hugo).
connaitre(christian,hugo).
connaitre(robert,sara).
connaitre(mustapha,robert).
connaitre(stan,christian).
connaitre(robert,sara).
connaitre(hugo,mustapha).
connaitre(sara,mustapha).
connaitre(sebastian,robert).
connaitre(sebastian,hugo).
connaitrem(X,Y):-connaitre(X,Y);connaitre(Y,X).
/* Ecrire les requêtes Prolog qui répondent aux questions suivantes:
Est ce que je connais cette personne?
Qui peut me présenter à cette personne? (Quelqu'un que je connais qui connaît la personne) */

/* On assume que "je" suis Robert.

- Est ce que je connais cette personne?
?- connaitre(robert,stan).
true .
?- connaitre(robert,christian).
false.

- Qui peut me présenter à cette personne? (Quelqu'un que je connais qui connaît la personne)
?- connaitrem(robert,sara),connaitrem(sara,mustapha).
true .
*/
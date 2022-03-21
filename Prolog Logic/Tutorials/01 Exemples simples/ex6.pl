/* Exercice 6
Considérez la base de faits suivantes:*/
trajet('Windsor', 'Toronto', bus).
trajet('Windsor', 'Detroit', bus).
trajet('Toronto', 'NorthBay', bus).
trajet('Toronto', 'Montreal', bus).
trajet('Toronto', 'Ottawa', bus).
trajet('Toronto', 'Kingston', bateau).
trajet('Kingston', 'Ottawa', bateau).
trajet('Montreal', 'Ottawa', bus).
/*Donnez les requêtes suivantes:
1. y a t il un trajet entre Windsor et Ottawa?
2. Peut-on visiter la ville du Québec?
3. Quelles sont les villes escales pour aller de Toronto à Ottawa (considérer une seule escale).
4. Peut on avoir un chemin agréable entre Windsor et Kingston? (un chemin est dit agréable lorsqu'il alterne un trajet en bus et un trajet en bateau!).*/

/*
1. Non.
2. Non.
3. Kingston (Toronto -> (bateau) Kingston -> (bateau) Ottawa)
4. Oui. 
Windsor à Toronto en bus. Puis Toronto à Kingston en bateau.
*/

/*
1. =========================
?- trajet('Windsor', 'Ottawa', X).
false.
2. =========================
?- trajet(X, 'Quebec', X).
false.
3. =========================
?- trajet('Toronto',VilleEscale,Z),trajet(VilleEscale,'Ottawa',Y).
VilleEscale = 'Montreal',
Z = Y, Y = bus ;
VilleEscale = 'Kingston',
Z = Y, Y = bateau ;
false.

?- trajet('Toronto',X,Z),trajet(X,'Ottawa',Y).
X = 'Montreal',
Z = Y, Y = bus ;
X = 'Kingston',
Z = Y, Y = bateau ;
false.
4. =========================
?- trajet('Windsor',X,Y),trajet(X,'Kingston',Z).
X = 'Toronto',
Y = bus,
Z = bateau ;
false.
*/

/*Voici un autre façon de faire question 4 en ajoutant cette ligne de code.*/
agreable(X,Y) :- trajet(X,Z,T),trajet(Z,Y,W),T\=W.
/*
?- agreable('Windsor','Kingston').
true .
*/
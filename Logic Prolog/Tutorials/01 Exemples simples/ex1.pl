/* Testing comment
# Testing comment <-- this isn't an actual comment
% Testing comment*/

/* Soit la base de faits Prolog suivante :*/
naissance(charles, lisa, philip).
naissance(anne, lisa, philip).
naissance(bob, lisa, philip).
naissance(edward, lisa, philip).
naissance(diana, mary, richard).
naissance(paul, diana, charles).
naissance(john, diana, charles).
/*
Quel sera le résultat de la requête suivante :
?- naissance (S, lisa, Y), naissance (G, M, S)
Donner toutes les solutions qui seront obtenues, dans l'ordre ou elles seront trouvées.
Ça va afficher
S = charles
Y = philip
puis ça va afficher tous les faits naissance(G,M,S), ou plus précisement, naissance(G,M,charles)
G = paul
M = diana
G = john
M = diana

Wrong display and order based on the results.
*/

/*
Résultats dans SWI-Prolog
?- naissance(S,lisa,Y),naissance(G,M,S).
S = charles,
Y = philip,
G = paul,
M = diana ;
S = charles,
Y = philip,
G = john,
M = diana ;
false.
*/
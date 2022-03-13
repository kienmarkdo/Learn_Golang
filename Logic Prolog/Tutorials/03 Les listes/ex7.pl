% Exercice 7
% 1. Qu’affichera la requête:
?- boucle(10).
% pour le programme suivant et expliquer le fonctionnement:
entier(0).
entier(X) :- entier(Y), X is Y+1.
boucle(N) :- repeat, entier(X), writeln(X), X>=N, !.

% Réponse :

?- boucle(10).
0
1
2
3
4
5
6
7
8
9
10
% true. 
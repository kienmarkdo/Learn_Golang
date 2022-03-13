% Exercice 2
% Écrire le prédicat permettant de trouver la somme des entiers de 1 à N.


somme(integer, integer).

somme(1,1).
somme(N,T) :- N >= 2, N_1 = N - 1, somme(N_1,T2), T is T2 + N.
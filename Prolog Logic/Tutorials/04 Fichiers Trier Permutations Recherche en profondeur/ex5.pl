% Exercice 5

% Comment peut-on définir le prédicat permut qui retourne toutes
% les permutations possibles d’une liste.
% Voici un exemple d’utilisation :

/* Exemple :
?- permut([1,2,3],L).
L = [1,2,3] ;
L = [1,3,2] ;
L = [2,1,3] ;
L = [2,3,1] ;
L = [3,1,2] ;
L = [3,2,1] ;
no
*/

perm([],[]).
perm(L,[H|T]) :-
append(V,[H|U],L),
append(V,U,W), perm(W,T).

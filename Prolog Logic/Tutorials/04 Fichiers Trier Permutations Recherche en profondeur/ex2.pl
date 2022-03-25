% Exercice 2

% Donnez la définition du prédicat occurrence (L,X,N) qui est vrai si N est le nombre de fois où X est présent dans la liste L.

occurence([],X,0).
occurence([X|T],X,Y):- occurence(T,X,Z), Y is Z+1.
occurence([X1|T],X,Z):- X1\=X, occurence(T,X,Z).

% Exemples d'exécutions
% ?- occurence([1,1,2,2,2,33,3,3], 33, L).
% L = 1 .

% ?- occurence([1,1,2,2,2,33,3,3], 3, L).
% L = 2 .

% ?- occurence([1,1,2,2,2,33,3,3], 1, L).
% L = 2 .

% Exercice 5
% Soit la base de faits et prédicats suivants :
sad(X) :- \+ happy(X). 
happy(X):- beautiful(X), rich(X).
rich(bill).
beautiful(michael). rich(michael).
beautiful(cinderella).
% 1. Quel est le résultat des requêtes suivantes:
?- sad(bill).
% Yes
?- sad(cinderella).
% Yes
?- sad(michael). 
% No
?- sad(jim).
% Yes
?- sad(Someone).
% No 

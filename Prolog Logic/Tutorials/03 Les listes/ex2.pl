% Exercice 2
% Soit la base de faits et prédicats suivants :
part(a). part(b). part(c).
red(a). black(b).
color(P,red) :- red(P),!.
color(P,black) :- black(P),!.
color(P,unknown).

% 1. Déterminer le résultat des requêtes suivantes en dessinant l’arbrede recherche de chaque requête
% ?- color(a,C).
% ?- color(c,C).
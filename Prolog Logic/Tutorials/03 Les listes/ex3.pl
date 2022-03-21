% Exercice 3
% Soit la base de faits et prédicats suivants :
s(X,Y):- q(X,Y).
s(0,0).
q(X,Y):- i(X), j(Y).
i(1).
i(2).
j(1).
j(2).
j(3).
% 1. Déterminer le résultat de la requête suivante en dessinant l’arbrede recherche.
% ?- s(X,Y).
% 2. Si on définit le prédicat :
% q(X,Y):- i(X), !, j(Y).
% Quel sera le résultat de la requête:
% ?- s(X,Y).
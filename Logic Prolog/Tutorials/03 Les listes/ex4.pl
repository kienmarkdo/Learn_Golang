% Exercice 4
% Soit la base de faits suivante:
p(a).
p(b).
q(c).
% 1. Quel est le résultat des requêtes suivantes:

?-not p(X), q(X). % fails
?-q(X), not p(X). % succeeds with X = c
% Exercice 3

% Il existe 13 983 816 combinaisons possibles au Loto 6/49; ceci représente toutes les
% combinaisons possibles de 6 nombres (peu importe l’ordre) parmi 49. On vous demande de
% définir le prédicat permettant de trouver le nombre de combinaisons de K nombres parmi N
% nombres.
% Vérifier que vous obtenez la bonne réponse avec
% ?- combinaisons(6,49,13983816).
% True
% Note: pensez à utiliser le prédicat factoriel/2.

factoriel(0, 1).
factoriel(Input, Result) :- Input > 0, Input2 is Input - 1, factoriel(Input2, R2), Result is Input * R2.

% R and N are variables in nCr; C is Combinaisons
combinaisons(R, N, C) :- N >= R, factoriel(N, N1), factoriel(R, R1), NR is N - R, factoriel(NR, NR1), C is (N1 / (R1 * NR1)).

% Mes résultats:
% ?- combinaisons(6,49,13983816).
% true .

% ?- combinaisons(6,49,N).
% N = 13983816 ;
% false.
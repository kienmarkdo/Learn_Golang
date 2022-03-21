% Exercice 2

% L’heure du jour est exprimée en heures, minutes et secondes, comme c(H, M, S). On veut
% écrire un prédicat qui va produire l’heure suivante (c’est-à-dire une seconde plus tard). Voici
% quelques exemples:

% ?- heureSuivanteS(c(21, 54, 25), N).
% N = c(21, 54, 26) .
% ?- heureSuivanteS(c(21, 54, 59), N).
% N = c(21, 55, 0) .
% ?- heureSuivanteS(c(21, 59, 59), N).
% N = c(22, 0, 0) .
% ?- heureSuivanteS(c(23, 59, 59), N).
% N = c(0, 0, 0).

heureSuivanteS(c(H, M, S), c(H, M, SN)) :- S < 59, SN is S + 1.
heureSuivanteS(c(H, M, S), c(H, MN, 0)) :- S =:= 59, MN is H + 1.
heureSuivanteS(c(H, M, S), c(HN, 0, 0)) :- M =:= 59, S =:= 59, H < 23, HN is H + 1.
heureSuivanteS(c(H, M, S), c(0, 0, 0)) :- H =:= 23, M =:= 59, S =:= 59.
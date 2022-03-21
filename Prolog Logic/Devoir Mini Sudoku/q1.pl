% Nom: Kien Do
% Cours: CSI 2520 - Paradigms de programation Hiver 2022
% Professeur: Robert Laganière
% Devoir Prolog - Mini Sudoku

% Question 1

% Définir le prédicat different/1 qui est vrai lorsque tous les nombres d’une liste sont différents.
% ?- different([1,3,6,4,8,0]).
% yes
% ?- different([1,3,6,4,1,8,0]).
% no

different([]).
different([_|[]]) :- !.
different([T|Q]) :- not(notre_member(T, Q)), different(Q).

% notre_member vérifie si l'élément X est dans la liste [_|L] ou non.
notre_member(X,[X|_]) :- !.
notre_member(X,[_|L]) :- notre_member(X,L).


% Exemples d'exécutions
% ?- different([1,3,6,4,1,8,0]).
% false.

% ?- different([1,3,6,4,8,0]).
% true.

% ?- different([1,3,6,4,8,0,1]).
% false.

% ?- different([1,3,6,4,8,0,3]).
% false.

% ?- different([1,3,5,4,8,0]).
% true.

% ?- different([1,3,5,5,8,0]).
% false.

% ?- different([]).
% true.

% ?- different([0]).
% true.

% ?- different([0,0]).
% false.
% Nom: Kien Do
% Cours: CSI 2520 - Paradigms de programation Hiver 2022
% Professeur: Robert Laganière
% Devoir Prolog - Mini Sudoku

% Question 4

% Définir le prédicat allDifferents/1 qui vérifie si chacune des sous-listes d’une liste de listes contient des nombres différents. 
% Utiliser le prédicat different/1 de la question a) dans la définition de ce prédicat.

allDifferents([], []).
allDifferents([], _) :- !.
allDifferents([T|Q], L) :- insertFront(T, L, LL), different(LL), allDifferents(Q, L).
allDifferents([L1, L2]) :- allDifferents(L1, L2).

% inserts element to the front of a list
insertFront(A, L, [A|L]).

% checks if all elements in a list are unique or not
different([]).
different([_|[]]) :- !.
different([T|Q]) :- not(notre_member(T, Q)), different(Q).

% notre_member vérifie si l'élément X est dans la liste [_|L] ou non.
notre_member(X,[X|_]) :- !.
notre_member(X,[_|L]) :- notre_member(X,L).


% Exemples d'exécutions
% ?- allDifferents([[1,3,6,4,8,0],[1,3,6,4,1,8,0]]).
% false.

% ?- allDifferents([[1,3,6],[4,1,8]]).
% false.

% ?- allDifferents([[1,3,6],[4,2,8]]).
% true.

% ?- allDifferents([[1,3,6],[4,2,9]]).
% true.
% Nom: Kien Do
% Cours: CSI 2520 - Paradigms de programation Hiver 2022
% Professeur: Robert Laganière
% Devoir Prolog - Mini Sudoku

% Question 5

% Afin de vérifier la validité d’un Sudoku, vous avez simplement à vérifier si toutes les sous-listes de 
%   la représentation du Sudoku sont toutes différentes (alldifferents) et si toutes les sous-listes obtenues 
%   à partir de extract4Columns et extract4Quadrants sont aussi toutes différentes (alldifferents).
% Définir le prédicat checkSudoku/1 en vous basant sur cette stratégie.

% ?- sudoku(M),checkSudoku(M).
% yes;
% no.

sudoku([[2,1,4,3],[4,3,2,1],[1,2,3,4],[3,4,1,2]]).
sudoku([[2,1,4,3],[4,3,2,1],[1,2,3,3],[3,4,1,2]]).

checkSudoku(M) :- 
    allDifferents(M),
    extract4Columns(M, M1),
    allDifferents(M1),
    extract4Quadrant(M, M2),
    allDifferents(M2),
    !
.

% extracts a row representation of a 4x4 list and produces a column representation of the same 4x4 list
extract4Columns([ [A1,A2,A3,A4], [B1,B2,B3,B4], [C1,C2,C3,C4], [D1,D2,D3,D4] ], 
					[ [A1,B1,C1,D1], [A2,B2,C2,D2], [A3,B3,C3,D3], [A4,B4,C4,D4] ]).

% extracts a row representation of a 4x4 list and produces a quadrant representation of the same 4x4 lists
extract4Quadrant([ [A1,A2,A3,A4], [B1,B2,B3,B4], [C1,C2,C3,C4], [D1,D2,D3,D4] ], 
					[ [A1,A2,B1,B2], [A3,A4,B3,B4], [C1,C2,D1,D2], [C3,C4,D3,D4] ]).

% checks to see if a list containing 4 lists are different from each other or not.
allDifferents([]).
allDifferents([T|Q]) :- different(T), allDifferents(Q).

% checks if all elements in a list are unique or not
different([]).
different([_|[]]) :- !.
different([T|Q]) :- not(notre_member(T, Q)), different(Q).

% notre_member vérifie si l'élément X est dans la liste [_|L] ou non.
notre_member(X,[X|_]) :- !.
notre_member(X,[_|L]) :- notre_member(X,L).

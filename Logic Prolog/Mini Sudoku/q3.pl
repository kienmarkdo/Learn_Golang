% Nom: Kien Do
% Cours: CSI 2520 - Paradigms de programation Hiver 2022
% Professeur: Robert Laganière
% Devoir Prolog - Mini Sudoku

% Question 3

% Définir le prédicat extract4Quadrants/2 qui extrait les 4 quadrants d'un mini-Sudoku.
% ?- sudoku(M), extract4Quadrant(M,L).
% L=[[2,1,4,3],[4,3,2,1],[1,2,3,4],[3,4,1,2]])

sudoku([[2,1,4,3],[4,3,2,1],[1,2,3,4],[3,4,1,2]]).
% sudoku([[2,1,4,3],[4,3,2,1],[1,2,3,3],[3,4,1,2]]).

extract4Quadrant([ [A1,A2,A3,A4], [B1,B2,B3,B4], [C1,C2,C3,C4], [D1,D2,D3,D4] ], 
					[ [A1,A2,B1,B2], [A3,A4,B3,B4], [C1,C2,D1,D2], [C3,C4,D3,D4] ]).
% Nom: Kien Do
% Cours: CSI 2520 - Paradigms de programation Hiver 2022
% Professeur: Robert Laganière
% Devoir Prolog - Mini Sudoku

% Question 2

% Définir le prédicat extract4Columns/2 qui extrait les 4 colonnes d’un mini-Sudoku.
% ?- sudoku(M), extract4Columns(M,L).
% L=[[2,4,1,3],[1,3,2,4],[4,2,3,1],[3,1,4,2]])

sudoku([[2,1,4,3],[4,3,2,1],[1,2,3,4],[3,4,1,2]]).
% sudoku([[2,1,4,3],[4,3,2,1],[1,2,3,3],[3,4,1,2]]).

extract4Columns([ [A1,A2,A3,A4], [B1,B2,B3,B4], [C1,C2,C3,C4], [D1,D2,D3,D4] ], 
					[ [A1,B1,C1,D1], [A2,B2,C2,D2], [A3,B3,C3,D3], [A4,B4,C4,D4] ]).

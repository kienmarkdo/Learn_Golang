% Exercice 4

% Comment peut-on définir le tri par insertion
% tri_insertion(L,L1) : qui construit la liste triée L1 des
% éléments de L ?

sorting([A|B], Sorted) :- sorting(B, SortedTail), insert(A,
SortedTail, Sorted).
sorting([], []).
insert(A, [B|C], [B|D]) :- A @> B, !, insert(A, C, D).
insert(A, C, [A|C]).

% Résultat
% ?- sorting([5,4,3,2,1], L).
% L = [1, 2, 3, 4, 5].
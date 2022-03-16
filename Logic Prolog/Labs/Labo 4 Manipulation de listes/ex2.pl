% Exercice 2: Pair et Impair

% Écrivez un programme Prolog, qui procès une liste de nombre et retourne une liste contenant
% ‘odd’ et ‘even’, qui correspond à la position des nombres dans la première liste.
% ?- oddEven([3,1,5,2,7,3],L).
% L = [odd,odd,odd,even,odd,odd].

% Réponse

% notre-append([],Y,Y).
% notre-append([A|B],Y,[A|W]) :- notre-append(B,Y,W).


% oddEven([], []).
% oddEven([T|[]], L) :- mod(T, 2) =:= 0, L is [even], !.
% oddEven([T|[]], L) :- mod(T, 2) =:= 1, L is [odd], !.


% oddEven([T|Q], L) :- oddEven(Q, LL), mod(T, 2) =:= 0, L is [even|LL].
% oddEven([T|Q], L) :- oddEven(Q, LL), mod(T, 2) =:= 1, L is [odd|LL].

insert(A, L, [A|L]). % insert element A in front of L

oddEven([T|[]], [even]) :- mod(T, 2) =:= 0, !.
oddEven([T|[]], [odd]) :- mod(T, 2) =:= 1.

oddEven([T|Q], [even|Q]) :- mod(T, 2) =:= 0, !.
oddEven([T|Q], [odd|Q]) :- mod(T, 2) =:= 1.

oddEven([T|Q], L) :- oddEven(Q, LL), insert(LL, Q, L).


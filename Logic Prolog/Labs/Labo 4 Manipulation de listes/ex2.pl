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




% insert(A, L, [A|L]). % insert element A in front of L

% oddEven([T|[]], [even]) :- mod(T, 2) =:= 0, !.
% oddEven([T|[]], [odd]) :- mod(T, 2) =:= 1.

% oddEven([T|Q], [even|Q]) :- mod(T, 2) =:= 0, !.
% oddEven([T|Q], [odd|Q]) :- mod(T, 2) =:= 1.

% oddEven([T|Q], L) :- oddEven(Q, LL), insert(LL, Q, L).


% Working version submit START
oddEven(L, R) :- oddEven(L, [], RR), notre_reverse(RR, R), !. % [] is the final list, X is the odd/even indicator
oddEven([], AA, AA). % end case for when the input list L is empty
oddEven([H|T], A, R) :-
            mod(H, 2) =:= 1,
            insert(odd, A, AA),
            oddEven(T, AA, R).
oddEven([H|T], A, R) :-
            mod(H, 2) =:= 0,
            insert(even, A, AA),
            oddEven(T, AA, R).

% Helper functions
insert(A, L, [A|L]).

renverser([],L,L) :- !.
renverser([H|T],L,R) :- renverser(T,[H|L],R).

notre_reverse(L,R) :- renverser(L,[],R).
% working version submit END



% working version START
% oddEven(IN, OUT) :- find(IN, [], REV), reverse(REV,OUT).

% even(X) :- 0 is mod(X, 2).
% odd(X) :- 1 is mod(X, 2).

% process(X,OLD, NEW) :- even(X), ! , insert(even,OLD,NEW).
% process(X,OLD, NEW) :- insert(odd,OLD,NEW).

% find([],X,X). %base case
% find([F|L], LIST, OUT) :- process(F,LIST,L2), find(L,L2,OUT).

%Helper function
% insert(A,L,[A|L]).
% working version END
/* Question 1 */

/* a) Occurrence
Write a predicate numOccur in Prolog which is true if the number E occurs R times in the list. For example:
?- numOccur(4, [1, 7, 5, 0, 4, 1, 4, 6], R).
R = 2.
?- numOccur(4, [1, 7, 5, 0, 8, 1, 8, 6], R).
R = 0.
?- numOccur(4, [ ], R).
R = 0.
*/

numOccur(R, [], 0) :- !.
numOccur(E, [H|T], R) :- numOccur(E, T, RR), E = H, R is RR + 1, !.
numOccur(E, [H|T], R) :- numOccur(E, T, R).

/* b) Flipping
Write a predicate flip. Flip is to exchange the order of pairs itself and in the list.
Example:
?- flip( [ (a, b), ( c, d)], L )
L = [ (d,c), (b,a) ].
?- flip( [ (a, b), ( c, d), (e, f), (g, h), (1, 2)], L ).
L = [(2, 1), (h, g), (f, e), (d, c), (b, a)].
?- flip( [], L ).
L = [].
?- flip( [(1,2)], L ).
L = [(2, 1)].
*/

% helper predicates from Professor Robert's notes
notre_insert(A,L,[A|L]).

renverser([],L,L) :- !.
renverser([H|T],L,R) :- renverser(T,[H|L],R).
notre_reverse(L,R) :- renverser(L,[],R).


%flip([], []).
%flip([(A, B)|T], L) :- flip(T, LL), notre_insert((B, A), LL, L). % this is wrong; we need to use tail-recursion

% Base case - end of list copy accumulator to result
flip( [], RL, RL ).

% Recursive case flipping the list of two
flip( [(A,B)|TI], ACC, LO ) :- 
  flip( TI, [(B,A)|ACC], LO ).

% LI is input list, LO is result, accumulator is initialized to []
flip( LI, LO ) :- flip( LI, [], LO ).





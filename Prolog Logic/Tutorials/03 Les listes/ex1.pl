% Exercice 1
% Soit la base de faits et prédicats suivants :
p(a).                   /* #1 */
p(X) :- q(X), r(X).     /* #2 */
p(X) :- u(X).           /* #3 */
q(X) :- s(X).           /* #4 */
r(a).                   /* #5 */
r(b).                   /* #6 */
s(a).                   /* #7 */
s(b).                   /* #8 */
s(c).                   /* #9 */
u(d).                   /* #10 */
% 1. Tracer l’arbre de recherche de P(X)
% 2. Tester les requêtes suivantes:
% ?- p(X),!.
% ?- r(X),!,s(Y).
% ?- r(X), s(Y), !.
% p(X) :- q(X), !, r(X).
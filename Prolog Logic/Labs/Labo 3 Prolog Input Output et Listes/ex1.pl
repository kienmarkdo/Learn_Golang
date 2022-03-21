% Exercice I

% decompte(N):- repeat,
%    writeln(N),
%    N is N-1,
%    N < 0, !.
% Tester le prédicat ci-dessus avec la requête:
% ?- decompte(5).
% Que se passe-t-il? Pourquoi? Trouver une solution au problème observé

% will loop forever with the same number because N is N-1 fails
% Free variable cannot be re-assigned in Prolog and will not work.

decompte2(N) :- N < 0, !. % base case
decompte2(N) :- writeln(N), N1 is N - 1, decompte2(N1).
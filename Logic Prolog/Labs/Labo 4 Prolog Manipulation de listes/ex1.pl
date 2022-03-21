% Exercice 1: Maximum and Minimum Elements

% Écrivez un programme Prolog pour déterminer le maximum et le minimum des valeurs dans une
% liste de nombres. Le programme doit se comporter comme décrit dessous.
% ?- maxmin([3,1,5,2,7,3],Max,Min).
% Max = 7
% Min = 1
% ?- maxmin([2],Max,Min).
% Max = 2
% Min = 2

% Réponse

getMax([T], T).
getMax([T|Q], Max) :- getMax(Q, Max), Max > T.
getMax([T|Q], T) :- getMax(Q, MaxN), MaxN < T.

getMin([T], T).
getMin([T|Q], Min) :- getMin(Q, Min), Min < T.
getMin([T|Q], T) :- getMin(Q, MinN), MinN > T.

maxmin([T|Q], Max, _) :- getMax([T|Q], Max).
maxmin([T|Q], _, Min) :- getMin([T|Q], Min).

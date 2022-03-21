% Exercice 6
% Comment peut-on représenter "Colbert n’aime pas les ours (indépendamment de ce qu’il aime d’autre)." ?

% 1. Une solution: Ajouter "not(ours(X))" à chaque règle qui décritceque Colbert aime.
% Par exemple:
aime(colbert, X) :- animal(X), not(ours(X)).
aime(colbert, X) :- jouet(X), not(ours(X)).
aime(colbert, X) :- vitEnArctique(X), not(ours(X)).
% ...

% 2. Essayons d’utiliser l’échec (fail) comme alternative.
% Premier essai:
ours(yogi).
animal(yogi).
aime(colbert, X) :- ours(X), fail.
aime(colbert, X) :- animal(X).

% Quel est le résultat de la requête:
?- aime(colbert, yogi).
% Réponse : Yes

% Vous remarquez qu’on doit ajouter une coupe (cut) pour empêcherles autres règles d’être essayer après que la première règle arrive à un échec.

% Deuxième essai:
ours(yogi).
chat(tom).
animal(yogi).
animal(tom).
aime(colbert, X) :- ours(X), !, fail.
aime(colbert, X) :- animal(X).

% 3. Quel est le résultat des requêtes suivantes:
?- aime(colbert, yogi). % No
?- aime(colbert, tom). % Yes
?- aime(colbert, X). % No

% 4. Quel est l’inconvénient de cette solution ?
% Réponse : Cette solution marche seulement lorsque X est instancié. 
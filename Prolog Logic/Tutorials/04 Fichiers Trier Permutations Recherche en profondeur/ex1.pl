% Exercice 1

% Que fait ce prédicat:
premier([X|_],X).

% Quel est le résultat de la requête ?
?- premier([2,4,6],2).

% Et celui-ci:
dernier([X],X).
dernier([_|L],X) :- dernier(L,X).

% Et enfin celui-là
compte([],0).
compte([_|R],N) :- compte(R,N1), N is N1+1, N>0.

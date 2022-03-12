% Question 1 (1 point) 
% Le prédicat suivant:

% gSeries(X,Y):-gSeries(X,0,Y).
% gSeries(X,N,Y):-power(X,N,Y).
% gSeries(X,N,Y):- N1 is N+1, power(X,N1,Y), gSeries(X,N1,Y).

% devrait donner comme solutions, la suite des X à la N, pour N=0,1,2,3,4... Par exemple:

% ?- gSeries(3,Y).

% Y=1;
% Y=3;
% Y=9;
% Y=27;
% Y=81.

% Malheureusement, le résultat obtenu n'est pas le bon.

% Pouvez-vous corriger ce prédicat? Ne changer qu'une seule formule.

% Réponse

power( X, 0, 1 ). % pour x^0.
power( X, 1, X ).
power( X, Y, Z ) :- Y > 1, Y1 is Y - 1,
power( X, Y1, Z1 ), Z is X * Z1.


gSeries(X,Y):-gSeries(X,0,Y).
gSeries(X,N,Y):-power(X,N,Y).
gSeries(X,N,Y):- N1 is N+1, gSeries(X,N1,Y).

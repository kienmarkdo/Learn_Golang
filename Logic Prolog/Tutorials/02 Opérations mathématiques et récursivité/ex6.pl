% Exercice 6

% Écrivez un programme Prolog pour calculer la fonction d Ackerman.
% Notez bien que la valeur résultante, ainsi que le temps de calcul, grandit très vite, même pour des nombres petits. Par exemple, A(4,2) est un entier constitué de 19729 chiffres décimaux.

ack(0,Y,N) :- N is Y + 1.
ack(X,0,N) :- X > 0, X1 is X - 1, ack(X1, 1, N).
ack(X,Y,N) :- X > 0, Y > 0, X1 is X - 1, Y1 is Y - 1, ack(X, Y1, N1), ack(X1, Y1, N).
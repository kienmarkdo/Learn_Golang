% Exercice 3

% Soit le prédicat suivant :

factorial(0,1).
factorial(N,F) :-
    N>0,
    N1 is N-1,
    factorial(N1,F1),
    F is N * F1.

% Combien de fois le prédicat factorial/2 sera appelé par la requête suivante :
% ?- factorial(3,W).

% Justifier votre réponse en montrant l'arbre d'exécution.
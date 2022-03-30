/*
CSI2520: Paradigmes de programmation
Laboratoire 9: Prolog

Exercice 1:

Implémentez de manière efficace un prédicat Prolog fibo(N,F) pour calculer les nombres de Fibonacci,
sans utiliser la récursion terminal. Basez-vous sur l'idée de la mémorisation : chaque fois qu'un nombre
de Fibonacci a été calculé, on garde sa valeur en mémoire, afin de récupérer cette valeur quand on en a
besoin, évitant ainsi un recalcule, rendant le calcul linéaire en temps au lieu d'exponentiel.
Utilisez la méta-prédicat assert pour réaliser cette solution.
*/

% https://www.cse.unsw.edu.au/~billw/dictionaries/prolog/dynamic.html
:- dynamic fibo/2.

% Cas de bases
fibo(1, 1).
fibo(2, 1).

fibo(N, F) :- 
    N > 2,
    N1 is N - 1,
    fibo(N1, F1),
    N2 is N - 2,
    fibo(N2, F2),
    F is F1 + F2,
    asserta(fibo(N, F))
.
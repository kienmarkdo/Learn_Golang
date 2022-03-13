% Exercice 10
% L’implémentation correcte est celle avec cut(!) :
% - Le premier prédicat bubblesort cherche s’il est possible
% d’effectuer un swap.
% - Si oui, alors on effectue le swap et appelle bubblesort avec la
% nouvelle liste.
% - Sinon, on comprend que la liste est ordonnée, alors le second
% prédicat retourne la même liste comme solution.
% Concernant les prédicats swaps, vu que dans bubblesort, on a
% un cut après son appel, on ne pourra en faire qu’un seul à
% chaque appel de bubblesort.
% - Le premier swap est invoqué si le premier élément de la
% liste est supérieur au deuxième.
% - Sinon, on appelle le deuxième qui va lui tout simplement
% rappeler le premier swap en retirant le premier élément
% de la liste.
% - Les appels récursifs (aux swaps) s’arrêtent lorsqu’on
% effectue un swap ou lorsque la liste à swapper est de
% taille 1.
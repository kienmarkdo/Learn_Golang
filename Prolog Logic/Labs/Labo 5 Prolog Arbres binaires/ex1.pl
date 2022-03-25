/* 
    CSI2520: PARADIGMES DE PROGRAMMATION
    Laboratoire 8: Prolog

    Exercice 1: Leaf Nodes

    Écrivez un programme Prolog qui trouve tous les feuilles (Leaf) d’un arbre binaire et les retourne
    dans une liste.
    ?- leafNodes(t( 2, nil, t(3, nil, nil)),L).
    L = 3
*/

% seed
leafNodes(A, F) :- leafNodes(A, [], F).

% cas de base
leafNodes(nil, F, F) :- !.
leafNodes(t(Racine, nil, nil), F, [Racine|F]) :- !.

% diviser - Remarque: D est droite, G est gauche
leafNodes(t(Racine, Gauche, Droite), L, D) :-
    leafNodes(Gauche, L, G),
    leafNodes(Droite, G, D).


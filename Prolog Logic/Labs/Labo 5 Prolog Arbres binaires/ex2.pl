/*
    CSI2520: PARADIGMES DE PROGRAMMATION
    Laboratoire 8: Prolog

    Exercice 2: Cabin Puzzle

    Six filles dorment sur un lit superposé dans un cabinet au camp. Chaque fille a une couleur
    différente de couverture sur leur lit. Les lits sont alignée en une rangée d’oeu les couvertures sont
    de couleurs : rouge, noire, jaune, brun, bleu et vert.

        - Reeva et Haley sont les plus proches à la porte.
        - Les couleurs des couvertures dut lit du bas commence par les même lettre.
        - La couleur de la couverture à Beth ne commence pas par la même lettre que son nom.
        - La couverture bleu est en dessus de la couverture rouge.
        - Liza et Kayla aime leur lit du bas.
        - Kayla dort sur le lit du milieu.
        - Zoe ne dort pas sur le même lit que Kayla.
        - La couverture brune est à la fin de la rangé.
        - La couverture jaune est au-dessous de la couverture noire.

    La solution doit être présenté comme suit: Sol= [[Name,Color],[Name,Color],...], d’où l’ordre est
    similaire à l’ordre des lits. Ils sont dans l’ordre suivant : bas, haut, bas, haut partant de la gauche
    vers la droite. En utilisant le prédicat member/2 et l’opérateur or; compléter le prédicat bunkbed
    suivant :

    bunkbeds(L):- L=[[N1,C1],[N2,C2],[kayla,C3],[N4,C4],[N5,C5],[N6,C6]],
    ((N1=reeva,N2=haley);(N2=reeva,N1=haley)), % Constraint 1.
*/

bunkbeds(L) :- L = [[N1,C1],[N2,C2],[kayla,C3],[N4,C4],[N5,C5],[N6,C6]], 
                ((N1=reeva,N2=haley) ; (N2=reeva,N1=haley)), /* Constraint 1: Reeva et Haley sont les plus proches à la porte */
                member(C1, [brown, black, blue]),
                member(C3, [brown, black, blue]),
                member(C5, [brown, black, blue]),
                member([beth, C], L), member(C, [yellow, green, red]),
                member([blue, red], [[C1, C2], [C3, C4], [C5, C6]]),
                member(liza, [N1, N5]), /* Kayla est déjà specifiée */
                member(zoe, [N1, N2, N5, N6]), /* Exclure N4 */
                brown = C5,
                member([black, yellow], [[C1,C2], [C3, C4], [C5, C6]]),
                member(green, [C1, C2, C3, C4, C5, C6])
.


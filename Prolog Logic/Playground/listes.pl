%% ========================================================
% Listes : Introduction

% ?- [1,2,3,stop,abc]=A.
% A = [1, 2, 3, stop, abc].

% ?- [1,2,3,stop,abc]=[T|Q].
% T = 1,
% Q = [2, 3, stop, abc].

% ?- [1,2,3,stop,abc]=[1|Q].
% Q = [2, 3, stop, abc].

% ?- [1,2,3,stop,abc]=[1|_].
% true.

% ?- [1,2,3,stop,abc]=[1,2,3|_].
% true.

% ?- [1]=[T|Q].
% T = 1,
% Q = [].

% ?- []=[T|Q].
% false.

cons(X,Y,[X|Y]). % construire une liste

% ?- cons(1,[2,3],L).
% L = [1, 2, 3].

% ?- cons(1,[2,3],[1,2,3]).
% true.

% ?- cons(T,[2,3],[1,2,3]).
% T = 1.

% ?- cons(T,[E,3],[1,2,3]).
% T = 1,
% E = 2.

% ?- cons(1,Q,[1,2,3]).
% Q = [2, 3].

%% ========================================================
% Listes : Manipulation des listes

% ===================== Exemple : Concaténation de deux listes =====================
notre-append([],Y,Y).
notre-append([A|B],Y,[A|W]) :- notre-append(B,Y,W).

% ?- notre-append([1,2], [3,4], L).
% L= [1,2,3,4]
% ?- notre-append(X, [3,4], [1,2,3,4]).
% X= [1,2]
% ?- notre-append([1,2], [3,4], [1,2,3,4]).
% yes

% L'explication de notre-append() (se trouve à 38:00 dans le cours 04)

% na([], Y, Y).
% na([A|B], Y, [A|W]) :- na(B,Y,W).

% ?- na([1|2], [3|4], L).
% -> A = 1    B = [2] (la queue d'une liste est TOUJOURS une liste)
% -> Y = [3|4]
% -> L = [1|W] (ici, on ne sait pas W. Donc, on appelle le sous-but na(B,Y,W) )

% na([2], [3|4], W)
% -> A' = 2    B' = []
% -> Y' = [3,4]
% -> W = [2|W']

% na([], [3,4], W') (maintenant, on appelle le premier prédicat, na([], Y, Y))
% -> [] = []
% -> Y" = W' = [3|4]

% On peut retracer nos étapes maintenant.

% -> W = [2|W']
% -> W = [2| [3|4] ] <- W' = [3|4], donc W = [2,3,4]
% ?- na([2], [3|4], W) --> na([2], [3|4], [2,3,4])

% -> L = [1|W]
% -> L = [1| [2,3,4] ]] <- W = [2,3,4], donc L = [1,2,3,4]
% ?- na([1|2], [3|4], L) --> na([1|2], [3|4], [1,2,3,4])
% L = [1,2,3,4].

% Le program est terminé ici.


% ===================== Exemple : renverser une liste =====================

% version 1: faire des appels récursif, puis on construit la réponse en rémontant
notre-reverse([],[]).
notre-reverse([H|T],L) :- notre-reverse(T,LL), 
				notre-append(LL,[H],L).

% ?- notre-reverse([1,2,3,4],L).
% L= [4,3,2,1]

% ?- notre-reverse(L,[1,2,3,4]).
% L= [4,3,2,1]

% version 2: construire la réponse en déscendants, puis à la fin on va simplement retourner
renverser([],L,L)-!.
renverser([H|T],L,R):- renverser(T,[H|L],R).

notre-reverse(L,R) :- renverser(L,[],R).

% Sans la coupe, il y aurait une boucle infinie après la
% première solution de:
% ?- notre-reverse(L,[1,2,3,4]).

% L'explication de renverser() (se trouve à 55:00 dans le cours 04)

% renverser([],L,L) :- !.
% renverser([H|T],L,R) :- renverser(T,[H|L],R).

% ?- renverser([1,2,3], [], A).
% -> H = 1                        <- renverser([H|T],L,R)
% -> T = [2,3]
% -> L = []
% -> A = R

% :- renverser([2,3], [1], R)     <- renverser(T,[H|L],R).
% -> H' = 2                       <- renverser([H|T],L,R)
% -> T' = [3]
% -> L' = [1]
% -> R' = R

% renverser([3], [2,1], R')       <- renverser(T,[H|L],R).
% -> H" = 3                       <- renverser([H|T],L,R)
% -> T" = []
% -> L" = [2,1]
% -> R" = R'

% renverser([], [3,2,1], R")      <- renverser(T,[H|L],R).
% On appelle le premier prédicat maintenant,
% renverser([],[3,2,1],[3,2,1])   <- renverser([],L,L) :- !.

% Et si on fait la retrace, on a que,
% R" = [3,2,1]
% R' = R" = [3,2,1]
% R = R' = [3,2,1]
% A = R = [3,2,1]
% A = [3,2,1].

% Fin.


% ===================== Exemple : appartenance à une liste =====================
notre-member(X,[X|L]).
notre-member(X,[Y|L]) :- notre-member(X,L).

% Premier cas
% - C'est le cas trivial. Si X est la tête de la liste [X|L], le prédicat est évidemment vrai.

% Deuxième cas
% - Si X n'est pas la tête de la liste [Y|L], on va voir si X est dans la queue L ou non.
% - C'est-à-dire, on va vérifie X avec tous les têtes dans [Y|L].

% ===================== Exemple : la longeur d'une liste =====================
notre-length([],0).
notre-length([X|L],N) :- notre-length(L,NN), N is NN+1.

% Premier cas
% - Cas trivial. La longeur d'une liste vide est 0, par définition.

% Deuxième cas
% - Si c'est pas une liste vide, trouve moi la longeur de la queue de la liste "notre-length(L,NN)", puis la longeur de la liste complète sera la longeur de la queue, plus 1 "N is NN+1".

% ===================== Exemple : l'insertion dans une liste =====================
notre-insert(A,L,[A|L]).
notre-insert(A,[X|L], [X|LL]) :- notre-insert(A,L,LL).

% ?- insert(c, [a, b], L).
% L = [c, a, b] ;
% L = [a, c, b] ;
% L = [a, b, c] ;
% no

% Explication
% Fais-moi l'insertion de l'élément c dans la liste [a,b]
% Évidemment, il faut demander la question "où est-ce qu'on veut insérer c dans la liste [a,b]"?

% En réalité, non, pas besoin. Prolog va dire, implicitement, voilà tout les solutions, que c sera inséré en tête de la liste, au milieu de la liste, ou à la fin de la liste.

% L'explication de notre-insert() (se trouve à 1:09:50 dans le cours 04)

% ni(A, L, [A|L]).
% ni(A, [X|L], [X|LL]) :- ni(A, L, LL).

% ?- ni(c, [a,b], L)

% 1er solution
% A = c
% L = [a,b]
% E = [A|L] = [c|[a,b]]
% E = [c,a,b]             <- SOLUTION 1

% 2eme solution
% A = c
% X = a
% L = [b]
% E = [a|LL]             <- SOLUTION 2

% branche 1
% ni(c, [b], LL)          <- ni(A, L, LL)
% LL = [c, b]             <- premier requête, ni(A, L, [A|L]).
% E = [a, c, b]           <- retrace E = [a|LL]

% branche 2
% A' = c
% X' = b
% L' = []

% ni(c, [], LL')
% LL' = [c]
% LL = [b, c]
% E = [a, b, c]           <- SOLUTION 3


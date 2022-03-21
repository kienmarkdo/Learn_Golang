% Question 1 (1 point) 
% Le prédicat suivant devrait retourner l'index d'un élément dans un tableau (et retourner false si l'élément n'est pas présent).

% indexOf(X,[]):-!,fail.
% indexOf(X,[X],0).
% indexOf(X,[Y|L],N):-indexOf(X,L,NN),N is NN+1.

% Malheureusement, le résultat obtenu est le suivant:

% ?- indexOf(3,[5,3,7,5],M).
% false    **au lieu de M=1

% ?- indexOf(3,[5,3,7,5,3],M).
% M=4    **au lieu de M=1; M=4

% Pouvez-vous corriger ce prédicat? Ne changer qu'une seule formule.

% Réponse


% indexOf(_,[],-1) :- !, fail.
% indexOf(X,[Y],-1) :- !, fail.
% indexOf(X,[X],0).
% indexOf(X,[X|L],N) :- indexOf(X,L,NN), N is NN+1.
% indexOf(X,[Y|L],N) :- indexOf(X,L,NN), N is NN+1.

indexOf(X,[]):-!,fail.
indexOf(X,[X|_],0).
indexOf(X,[Y|L],N):-indexOf(X,L,NN),N is NN+1.

% outputs
% ?- indexOf(3,[5,3,7,5],M).
% M = 1 ;
% false.

% ?- indexOf(3,[5,3,7,5,3],M).
% M = 1 ;
% M = 4 ;
% false.

% ?- indexOf(3,[],M).
% false.

% ?- indexOf(3,[5,4,3,7,5,3],M).
% M = 2 ;
% M = 5 ;
% false.

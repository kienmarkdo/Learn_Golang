% Créer le prédicat inOrder/3 retournant vrai si
% les trois nombres sont en ordre (croissant ou décroissant).
% Exemples
%?- inOrder(3,9,12).
%true.

%?- inOrder(11,4,2).
%true.

%?- inOrder(2,8,4).
%false.

% =========================================
inOrder(A,B,C):- A>=B,B>=C.
inOrder(A,B,C):- C>=B,B>=A.
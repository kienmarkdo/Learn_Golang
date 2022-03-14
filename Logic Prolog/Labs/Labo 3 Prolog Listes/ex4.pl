% Exercice IV

% Ecrivez un predicat Prolog avantDernier qui retourne l’avant dernier
% element d’une liste.
% ?- avantDernier(X,[7,adc,foo,x,9,12]).
% X = 9

avantDernier(H, [H| [ _ | [] ] ]) :- !.
avantDernier(X,[_|T]) :- avantDernier(X,T).
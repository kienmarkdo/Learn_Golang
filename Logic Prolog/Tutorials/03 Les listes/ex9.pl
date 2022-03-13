% Exercice 9
% Écrire un programme Prolog interactif où l’utilisateur entre un nombre entier positif et est 
% alors affiché la valeur 2 à la puissance de ce nombre. 
% Puis un nouveau nombre est demandé. 
% Si un nombre négatif est entré alors le programme s’arrête.

% Réponse :

start :- repeat,  % loop forever
read(X),        % read number
power2(X,Y),    % our evaluation
write(Y), nl,   % output result
Y = end, !.     % stopping condition

power2(X,Y) :- X < 0, Y = end, !.
power2(X,Y) :- pow(2,X,Y).
pow(X, 1, X). 
pow(X, Y, Z) :- Y > 1, Y1 is Y-1, pow(X, Y1, Z1), Z is X * Z1. 

% Test exemples :

% Welcome to SWI-Prolog (threaded, 64 bits, version 8.4.2)
% SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
% Please run ?- license. for legal details.

% For online help and background, visit https://www.swi-prolog.org
% For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- start.
|: 2.
4
|: 3.
8
|: 45.
35184372088832
|: -45.
end
true.

?- 
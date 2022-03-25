% Exercice 3

% Soit le programme suivant:
main :-
    open('fruit.txt', read, Str),
    read_file(Str,Lines),
    close(Str),
    write(Lines), nl.

read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).

% Quel est le résultat de la requête :
% ?- main.
% Si le fichier fruit.txt contient les données suivantes:
% pomme.
% tomate.
% orange.
% celeri.
% poire.
% salade.

% Résultat
% ?- main.
% [pomme,tomate,orange,celeri,poire,salade]
% true .

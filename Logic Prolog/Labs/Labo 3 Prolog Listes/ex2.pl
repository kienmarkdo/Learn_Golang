% Exercice II

% Soit une base de fait donnant les symboles associés aux éléments
% chimiques:

% Par exemple :

element(chlore,'Cl').
element(helium,'He').
element(hydrogene,'H').
element(azote,'N').
element(oxygene,'O').

% Écrire un programme interactif Prolog où l’utilisateur propose un
% symbole et le programme donne le nom de l’élément correspondant. Si le
% symbole donné ne correspond à aucun élément le programme s’arrête,
% sinon il demande un nouveau symbole.

% Exemple :
% Donnez-moi un symbole : O
% O est le symbole de : oxygene
% Donnez-moi un symbole : He
% He est le symbole de : helium
% Donnez-moi un symbole : K
% Je l’ignore. Au revoir.

% Note to self: Don't know why it's only producing Chlore right now.
% Must enter 'Cl' with single quotation.
% Symbol to look up / Donnez-moi dun symbole : 'Cl'.
% Cl is the symbol for / est le symbole de : chlore

% Symbol to look up / Donnez-moi dun symbole : |: 'O'.
% O is the symbol for / est le symbole de : oxygene

% Symbol to look up / Donnez-moi dun symbole : |: 'K'.
% Don't know the symbol / Symbole n'existe pas : K
% Exiting

cherche(S) :-
    element(E, S),
    write(S), write(" is the symbol for / est le symbole de : "), writeln(E), !.

cherche(S) :-
    write("Don't know the symbol / Symbole n'existe pas : "), writeln(S), !, fail.

start :- 
    writeln("Elements in the periodic table / Elements dans un tableau des periodes"),
    repeat,
    writeln(""),
    write("Symbol to look up / Donnez-moi dun symbole : "),
    read(S),
    not(cherche(S)),
    writeln("Exiting"),
    !, fail.

?- start. % query to automatically start the "start" predicate






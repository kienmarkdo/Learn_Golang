% These are for comments
% Comments start with a %
% Statements end with a .
% Variables start with an upper case
% Atoms start with a lower case

% Facts
man(adam).
man(peter).
man(paul).
woman(marry).
woman(eve).

% Relations
parent(adam,peter). % means adam is parent of peter
parent(eve,peter).
parent(adam,paul).
parent(marry,paul).

% Rules
father(F,C) :- man(F),parent(F,C).
mother(M,C) :- woman(M),parent(M,C).
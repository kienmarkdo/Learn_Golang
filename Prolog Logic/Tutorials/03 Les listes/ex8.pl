% Exercice 8
% Soit le programme Prolog suivant:
q(a). q(b). s(a). s(e). s(f).
s(g). k(e). k(f). u(e). u(g).
p(X,X,c) :- q(X).
p(X,Y,Z) :- r(X,Y,Z),s(Z). r(X,Y,Z):-t(X,Z),
u(Y). 
t(X,Z) :- k(X),k(Z).
% a)
% Dessiner l’arbre de résolution complet généré par la requête:
?-p(X,Y,Z).
% en montrant bien les solutions qui seront trouvées.
% b)
% Ajouter une et une seule coupe (!) au programme ci-haut de façon à
% obtenir les solutions suivantes: t(X,Z):-k(X),!,k(Z). ?-p(X,Y,Z).
X = Y, Y = a, Z = c ;
X = Y, Y = b, Z = c ;
X = Y, Y = Z, Z = e ;
X = Z, Z = e, Y = g.
% c)
% Ajouter une et une seule coupe (!) au programme ci-haut de façon à
% obtenirseulement la solution suivante: p(X,X,c):-q(X),!. 
?- p(X,Y,Z).
X = Y, Y = a, Z = c. 
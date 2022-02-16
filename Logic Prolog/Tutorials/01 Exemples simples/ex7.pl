/*
Exercice 7
Considérez la base de faits suivantes :
*/

p(a,b).
p(a,c).
p(c,d).
p(d,e).
p(d,f).
p(n,w).

q(A,B) :- p(A,B).
q(A,B) :- p(X,B), q(A,X).

/*
Dessiner l'arbre de resolution pour la requète suivante :
?- q(a,e)
*/
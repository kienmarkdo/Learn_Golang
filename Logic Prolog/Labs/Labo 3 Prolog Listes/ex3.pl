% Exercice III

% Soit la base de fait suivante :
canalOuvert( samedi ).
canalOuvert( lundi ).
canalOuvert( mardi ).
pleuvoir( samedi ).
fond( samedi ).
fond( dimanche ).
fond( lundi ).
% Ecrivez un predicat Prolog qui retourne true s’il est sage d’aller au
% Bal de Neige. Il devrait retourner true si le canal est ouvert, s’il
% ne pleut pas et s’il ne fond pas. Votre solution doit utiliser coupefail et devrais fonctionner ainsi :
% ?- balDeNeige(X).
% X = mardi.
% Vous auriez besoin d’un predicat intermediaire a cause de la negation/

balDeNeige(X) :- canalOuvert(X), not(pleuvoir(X)), not(fond(X)).
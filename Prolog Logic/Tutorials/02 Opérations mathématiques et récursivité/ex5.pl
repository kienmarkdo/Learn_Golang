% Exercice 5

% Considérer la base de faits suivantes :
% % joueur(Joueur, Nom, Equipe)
joueur(p1, 'Stan', t1).
joueur(p2, 'Pierre', t1).
joueur(p3, 'Jochen', t2).
joueur(p4, 'Robert', t2).
joueur(p5, 'Paul', t3).
joueur(p6, 'Samuel', t3).

% % match (Match, EquipeLocale, EquipeVisiteuse, Saison).
match(g1, t1, t2, hiver11).
match(g2, t2, t3, hiver11).
match(g3, t1, t3, automne12).
match(g4, t2, t3, automne12).
match(g4, t2, t1, automne12).

% % but(Match, Joueur, TempsDuButEnMinutes)
but(g1, p1, 55). but(g1, p2, 10).
but(g1, p1, 22). but(g2, p3, 37).
but(g2, p3, 41). but(g2, p6, 60).
but(g3, p2, 33). but(g3, p5, 49).

% Écrire les requêtes suivantes:
% a) Trouver un match de la saison hiver 2011 ou l’équipe locale a marqué un but après la seconde
% moitié du match (c’est-à-dire après la 45ième minute).
% b) Trouver le nom d’un joueur ayant marqué au moins un but dans un match.
% c) Trouver le nom d’un joueur ayant marqué au moins un but dans plus d’un match.
% d) Trouver une équipe qui n’a pas jouée à domicile pendant la saison automne 2012.

% a) ===============================
% ?- match(Match, EquipeLocale, EquipeVisiteuse, hiver11), but(Match,_,Temps), Temps >= 45 .
% Match = g1,
% EquipeLocale = t1,
% EquipeVisiteuse = t2,
% Temps = 55 ;
% Match = g2,
% EquipeLocale = t2,
% EquipeVisiteuse = t3,
% Temps = 60.

% ?- match(Match,_,_, hiver11), but(Match,_,Z),Z>=45.
% Match = g1,
% Z = 55 ;
% Match = g2,
% Z = 60.

% b) ===============================
?- but(_,Joueur,_),joueur(Joueur, Nom,_).
% Joueur = p1,
% Nom = 'Stan' ;
% Joueur = p2,
% Nom = 'Pierre' ;
% Joueur = p1,
% Nom = 'Stan' ;
% Joueur = p3,
% Nom = 'Jochen' ;
% Joueur = p3,
% Nom = 'Jochen' ;
% Joueur = p6,
% Nom = 'Samuel' ;
% Joueur = p2,
% Nom = 'Pierre' ;
% Joueur = p5,
% Nom = 'Paul'.


% ?- joueur(Joueur, Nom, _), but(_, Joueur, _).
% Joueur = p1,
% Nom = 'Stan' ;
% Joueur = p1,
% Nom = 'Stan' ;
% Joueur = p2,
% Nom = 'Pierre' ;
% Joueur = p2,
% Nom = 'Pierre' ;
% Joueur = p3,
% Nom = 'Jochen' ;
% Joueur = p3,
% Nom = 'Jochen' ;
% Joueur = p5,
% Nom = 'Paul' ;
% Joueur = p6,
% Nom = 'Samuel'.


% c) ===============================
% ?- match(_,EquipeLocale,_,Saison),\+(Saison = automne12).
% EquipeLocale = t1,
% Saison = hiver11 ;
% EquipeLocale = t2,
% Saison = hiver11 ;
% false.
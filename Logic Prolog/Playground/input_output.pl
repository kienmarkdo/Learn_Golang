% Exemple interactif du cours 04, Les listes.
% Input/output

capitale(ontario,toronto).
capitale(quebec,quebec).
capitale(cb,victoria).
capitale(alberta,edmonton).
capitale(terre-neuve,st-jean).
capitale(nouvelle-ecosse,halifax).
capitale(saskatchewan,regina).
capitale(manitoba,winnipeg).
capitale(nouveau-brunswick,fredericton).
capitale(ipe,charlottetown).
start:-write('Les Capitales du Canada'),nl,demander.
demander:-write('Province? '),read(Province),reponse(Province).
reponse(stop):-write('merci'),nl.
reponse(Province):-capitale(Province,Ville),write('la capitale de '),
                   write(Province),write(' est '),write(Ville),nl,nl,demander.

% prédicat qui dit "je ne connait pas cette province"
reponse(P) :- \+capitale(P,_), write("je ne connais pas "), write(P), nl, demander.

% ?- start.
% Les Capitales du Canada
% Province? ontario.
% la capitale de ontario est toronto

% Province? cb.
% la capitale de cb est victoria

% Province? qwerty.
% je ne connais pas qwerty

% Province? stop.
% merci
% true .



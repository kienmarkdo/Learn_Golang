% Exercice 1

% 1. Ecrire un prédicat qui convertit une température en degrés Celsius à son équivalent en
% température en degrés Fahrenheit. La formule de conversion est donnée par l’expression
% suivante :
% F = C * 9/5 + 32
% 2. Ecrire un prédicat qui détermine si une température (ºF) est au dessous du point de
% congélation (32ºF).

% 1.
c_to_f(C,F) :- F is C * 9/5 + 32.

% 2.
f_is_freezing(F) :- F =< 32. % c'est =< et pas <=

% Résultats
% 1.

% ?- c_to_f(0,F).
% F = 32.

% ?- c_to_f(3,F).
% F = 37.4.

% ?- c_to_f(-3.4,F).
% F = 25.880000000000003.

% 2.
% ?- f_is_freezing(33).
% false.

% ?- f_is_freezing(32).
% true.

% ?- f_is_freezing(31).
% true.
% Exercice 4

% Soit la base de faits suivante :
regne(philippeIV,1285,1314).
regne(philippeIII,1270,1285).

% Et le prédicat suivant :
est_roi_en(Nom,Annee):- regne(Nom,A,B), Annee>=A, Annee=<B.
% Définissez un opérateur est_roi_en qui peut être utilisé de la façon suivante :
% philippeIII est_roi_en 1275
% R est_roi_en 1290

:- op(500, xfy, est_roi_en).

% https://www.swi-prolog.org/pldoc/man?section=operators

% ?- philippeIII est_roi_en 1275.
% true.

% ?- philippeIII est_roi_en 1276.
% true.

% ?- philippeIII est_roi_en 12.
% false.
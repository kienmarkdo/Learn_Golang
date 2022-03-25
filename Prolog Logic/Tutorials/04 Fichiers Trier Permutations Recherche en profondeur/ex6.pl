% Exercice 6

% Quatre personnages sont devant vous : un magicien, une
% magicienne, un sorcier, une sorcière. Chaque personnage a devant
% lui un sac rempli d'une ou plusieurs pièces de monnaie. Les
% pièces sont en bronze, en cuivre, en laiton ou en étain.

% Qui a le sac contenant le moins de pièces? Sachant que :

% 1. Il n'y a pas deux sacs aux contenus identiques.
% 2. Dans un sac, il ne peut pas y avoir deux pièces de même métal.
% 3. Chaque sac contient, une, deux ou quatre pièces.
% 4. Le sorcier et le magicien ont chacun une pièce qu'aucun des trois autres possèdent.
% 5. Tous les sacs sans pièces de laiton comportent une pièce de bronze.
% 6. Tous les sacs sans pièces en étain n'ont pas non plus de pièces en bronze.
% 7. La magicienne a plus d’une pièce dans son sac.

% Construire un programme Prolog utilisant une recherche en
% profondeur afin de trouver une solution à ce problème.

pieces([bronze,cuivre,laiton,etain]).

sac([X]):-pieces(P),member(X,P).
sac(S):-pieces(L),comb(2,L,S).
sac(S):-pieces(S).

valide(S):-sac(S),regle5(S),regle6(S).

solution([MM,SM,MF,SF]):-
valide(MM),valide(SM),valide(MF),valide(SF),MM\=SM,MM\=MF,MM\=SF,SM\=MF,SM\=SF,MF\=SF,regle4(
MM,SM,MF,SF),regle4(SM,MM,MF,SF),regle7(MF).

regle4(A,B,C,D):-member(X,A),\+member(X,B),\+member(X,C),\+member(X,D).
regle5(S):-member(laiton,S),!.
regle5(S):-member(bronze,S).
regle6(S):-member(etain,S),!.
regle6(S):- \+member(bronze,S).
regle7(S):-length(S,X),X>1.

comb(0,_,[]).
comb(N,[X|T],[X|Comb]):-N>0,N1 is N-1,comb(N1,T,Comb).
comb(N,[_|T],Comb):-N>0,comb(N,T,Comb).
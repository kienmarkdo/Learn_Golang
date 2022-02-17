/*
Laboratoire 4 - Prolog Basics

Soit la base de faits Prolog suivante :
*/
professeur(turing, csi2520).
professeur(codd, csi4533).
professeur(backus, csi2511).
professeur(ritchie, csi2772).
professeur(minsky, csi2510).
professeur(codd, csi2530).

etudiant(fred, csi2520).
etudiant(paul, csi4533).
etudiant(jean, csi2510).
etudiant(jean, csi2772).
etudiant(henri, csi2510).
etudiant(henri, csi2530).

annee(fred, 1).
annee(paul, 2).
annee(jean, 2).
annee(henri, 4).

/*
=============================================================
1. Quel sera le résultat de la requête suivante :
?- professeur(codd, Cours), etudiant(UnEtudiant, Cours).

- Réponse:
Cours = csi4533, UnEtudiant = paul ;
Cours = csi2530, UnEtudiant = henri.

Ça veut dire que le professeur codd enseigne deux cours, csi2533 et csi2530, où paul et henri sont ses étudiants, respectivement.

=============================================================
2. Donner toutes les solutions qui seront obtenues, dans l'ordre où elles seront trouvées.

- Réponse:
Cours = csi4533,
UnEtudiant = paul ;
Cours = csi2530,
UnEtudiant = henri.

=============================================================
3. Ecrire la requête permettant de trouver les étudiants de minsky

- Réponse:
?- professeur(minsky,Cours),etudiant(NomEtudiant, Cours).
Cours = csi2510,
NomEtudiant = jean ;
Cours = csi2510,
NomEtudiant = henri.

=============================================================
4. Ecrire la requête permettant de trouver les cours suivis par des étudiants de 4ème année

- Réponse:
?- annee(NomEtudiant, 4),etudiant(NomEtudiant, Cours).
NomEtudiant = henri,
Cours = csi2510 ;
NomEtudiant = henri,
Cours = csi2530.

=============================================================
5. Ecrire la requête permettant de trouver les étudiants qui ont le même professeur

- Réponse:
?- etudiant(Etudiant1,Cours),etudiant(Etudiant2,Cours).
Etudiant1 = Etudiant2, Etudiant2 = fred,
Cours = csi2520 ;
Etudiant1 = Etudiant2, Etudiant2 = paul,
Cours = csi4533 ;
Etudiant1 = Etudiant2, Etudiant2 = jean,
Cours = csi2510 ;
Etudiant1 = jean,
Cours = csi2510,
Etudiant2 = henri ;
Etudiant1 = Etudiant2, Etudiant2 = jean,
Cours = csi2772 ;
Etudiant1 = henri,
Cours = csi2510,
Etudiant2 = jean ;
Etudiant1 = Etudiant2, Etudiant2 = henri,
Cours = csi2510 ;
Etudiant1 = Etudiant2, Etudiant2 = henri,
Cours = csi2530.

ou

?- etudiant(Etudiant1,Cours),etudiant(Etudiant2,Cours),Etudiant1\=Etudiant2.
Etudiant1 = jean,
Cours = csi2510,
Etudiant2 = henri ;
Etudiant1 = henri,
Cours = csi2510,
Etudiant2 = jean ;
false.

=============================================================
6. Créer un prédicat 'note' donnant le résultat obtenu par un étudiant dans un cours. Les notes possibles sont a,b,c,d,e,f.
*/

note(fred, csi2520, a).
note(paul, csi4533, b).
note(jean, csi2510, c).
note(jean, csi2772, d).
note(henri, csi2510, d).
note(henri, csi2530, f).

/*
=============================================================
7. Ecrire un prédicat 'reussit(etudiant,cours)' vérifiant si un étudiant a passé un cours, ce prédicat doit vérifier si :

a. l'étudiant est inscrit à ce cours

b. et s'il a obtenu une note autre que e ou f
*/


reussit(Etudiant, Cours) :- etudiant(Etudiant, Cours), note(Etudiant,Cours,Note), Note\=e, Note\=f.

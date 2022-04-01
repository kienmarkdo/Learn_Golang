#lang scheme

#|
CSI2520: PARADIGMES DE PROGRAMMATION
Laboratoire 11: Scheme

Exercice 2: Advanced List Processing
Modifiez le code de la question précédente, pour qu’elle fonctionne lorsque les deux listes ne
sont pas de la même grandeur, en assumant que les valeurs manquant sont des 0. Le résultat doit
être une liste de la grandeur de la plus grande liste.
|#

; Example:
;
; (absDiffA ‘(1 3 5 6 2 5) ‘(3 5 2 1))
; => (2 2 3 5 2 5)
;
; (absDiffA ‘(1 3 5 6) ‘(3 5 2 1 2 5))
; => (2 2 3 5 2 5)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
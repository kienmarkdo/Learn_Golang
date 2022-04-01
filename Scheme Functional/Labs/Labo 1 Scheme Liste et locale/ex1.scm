#lang scheme

#|
CSI2520: PARADIGMES DE PROGRAMMATION
Laboratoire 11: Scheme

Exercice 1: List Processing with Error Checking
Écrivez un define de haut niveau absDiff, qui calcule la différence absolue des éléments
correspondant des deux listes. La fonction s’assure que les deux listes sont de la même grandeur,
sinon retourne une erreur. La boucle routine auxiliaire est la suivante :

(define (loop LA LB)
 (if (or (null? LA) (null? LB))
   '()
   (cons (abs (- (car LA) (car LB))) (loop (cdr LA) (cdr LB)))))
|#

; Examples:
;
; (absDiff ‘(1 3 5 6) ‘(3 5 2 1))
; => (2 2 3 5)
;
; (absDiff '(1 3 5 6 7) '(3 5 2 1))
; => "List have different length"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
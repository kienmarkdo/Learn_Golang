#lang scheme

#|
Question 1 (1 point) 
La fonction suivante permet de fusionner deux listes triées afin de produire une nouvelle liste triée.

(define (mergelists L M)
  (cond ( (null? L) _______________)
            ( (null? M) ______________)
            ( (< (car L)(car M)) (cons (car L) (mergelists (cdr L)M)))
            (else (cons (car M) (mergelists L (cdr M)))) ) )

Par exemple:

(mergelists '(1 4 7) '(2 3 9 12) ) 

devrait produire:

(1 2 3 4 7 9 12)
Les deux conditions null? de cette fonction doivent toutefois être complétées.
|#

(define (mergelists L M)
  (cond ( (null? L) M)
            ( (null? M) L)
            ( (< (car L)(car M)) (cons (car L) (mergelists (cdr L)M)))
            (else (cons (car M) (mergelists L (cdr M)))) ) )

(mergelists '(1 4 7) '(2 3 9 12) ) ; (1 2 3 4 7 9 12)
(mergelists '(5 6 7) ' (1 2 3 4))
(mergelists '(5 6 7 8) ' (1 2))
#lang scheme

#|
Question 1 (1 point) 
Soit le programme suivant qui devrait retirer les nombres négatifs dans une liste:

(define (removeNegative L)
 (cond
  ((null? L) '())
  ((< (car L) 0) (removeNegative (cdr L)))
  (else (append L
       (removeNegative (cdr L))))
  ) )

Malheureusement, le résultat obtenu n'est pas le bon, par exemple avec:

(removeNegative '(1 -2 3 -3 -4 5 4))

on obtient:

(1 -2 3 -3 -4 5 4 3 -3 -4 5 4 5 4 4)

au lieu de:
(1 3 5 4)

Corriger ce programme. Une seule ligne doit être changée. |#

(define (removeNegative L)
 (cond
   ((null? L) '())
   ((< (car L) 0) (removeNegative (cdr L)))
   (else (append (cons (car L) '() )
                 (removeNegative (cdr L))))))

(removeNegative '(1 -2 3 -3 -4 5 4))
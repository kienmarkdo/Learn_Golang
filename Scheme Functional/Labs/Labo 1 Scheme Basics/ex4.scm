#lang scheme

#|
        CSI2520: PARADIGMES DE PROGRAMMATION
             Laboratoire 10: Scheme

Exercice 4:

Définissez une fonction f qui prend deux nombres x et y en entrée et retourne la liste
contenant les nombres x+y, x-y, x/y et x*y.
|#

(define (f x y)
  (list (+ x y) (- x y) (/ x y) (* x y)))

(f 3 7)
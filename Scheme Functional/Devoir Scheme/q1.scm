#|
Nom: Kien Do
CSI2520 - Paradigms de programmation Hiver 2022
Devoir 3 Scheme

Question 1
|#

#lang scheme

; Helper function returns true if x is greater than 1
(define (greater-than-one x)
  (cond
    ((> x 1) #t)
    (else #f)))

; (lowest-exponent x y) takes as parameter an integer greater than one (base), and a target natural number (bound)
; returns the lowest positive integer (exponent) for which base^exponent >= bound.
(define lowest-exponent
  (lambda (x y)            ; alternate function syntax
    (if (greater-than-one x)
        (ceiling (log y x))
        "First paramer x (base) must be greater than 1.")))

; Test cases
(lowest-exponent -1 2)
(lowest-exponent 1 2)
(lowest-exponent 3 27)
(lowest-exponent 3 28)
  
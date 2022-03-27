#|
Nom: Kien Do
CSI2520 - Paradigms de programmation Hiver 2022
Devoir 3 Scheme

Question 2
|#

#lang scheme

; returns true if number x is abundant
(define (is-abundant x)
  (cond
    ((> (sum-of-list (find-divisors x x)) (* 2 x)) #t) ; returns true if sum of list returned by find-divisors is greater than 2 * x
    (else #f)
  )
)

; returns the sum of a list
(define (sum-of-list L)
  (apply + L)
)

; returns a list of all divisors of x - initially, the second parameter always takes x as input
(define (find-divisors x y)
  (cond
    ((<= y 1) '(1))
    ((= (modulo x y) 0) (append (list y) (find-divisors x (- y 1)))) ; if x mod y == 0, append the list '(y) to the list find-divisors(x y-1)
    (else (find-divisors x (- y 1)))
  )
)

; returns a list of all abundant numbers less than or equal to x
(define (find-abundant x)
  (cond
    ((< x 12) '())
    ((= x 12) '(12))
    ((is-abundant x) (append (list x) (find-abundant (- x 1))))
    (else (find-abundant (- x 1)))
  )
)
; Test cases
;(find-divisors 1 1)
;(find-divisors 24 24)
;(find-divisors 16 16)

;(is-abundant 24) ; true
;(is-abundant 20)
;(is-abundant 18)
;(is-abundant 12)
;(is-abundant 25) ; false

(find-abundant 2)
(find-abundant 25)
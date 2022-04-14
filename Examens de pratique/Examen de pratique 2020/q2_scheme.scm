#lang scheme

#|
Question 2 Scheme

Please note:
- You are not allowed to use set! in answering this question.
- You must comment your code

a) Occurrence
Write a function numOccur in Scheme which has arguments a number E and a list L and returns how
many times the number E occurs in the list L. For example:
(numOccur 4 ‘(1 7 5 0 4 1 4 6))
 2
(numOccur 4 ‘(1 7 5 0 8 1 8 6))
 0
(numOccur 4 ‘())
 0
|#

(define (numOccur E L)
  (cond
    ((null? L) 0)
    ((= (car L) E) (+ 1 (numOccur E (cdr L))))
    (else (numOccur E (cdr L)))
  )
)

; Test
(numOccur 4 '(1 7 5 0 4 1 4 6))
(numOccur 4 '(1 7 5 0 8 1 8 6))
(numOccur 4 '())

(newline)
"========================================================================="
(newline)

#|
b) Frequency
Write a Scheme function that accepts a list of numbers L and returns the frequency (number of
times) of each number occurs in the list. The frequency is to be returned in a list of lists where each
list contains the number as car and its frequency as the second element in the list as in the
following examples:
(frequency `())
 ()
(frequency `(1 5 2 7 1 6 1 6 4))
 ((1 3) (2 1) (4 1) (5 1) (6 2) (7 1))
(frequency `(1 5 9 7 -1))
 ((-1 1) (1 1) (5 1) (7 1) (9 1))
|#

(define (removeOccur num L)
  (cond
    ((null? L) '())
    ((= num (car L)) (append null (removeOccur num (cdr L))))
    (else (cons (car L)(removeOccur num (cdr L))))
  )
)
;(removeOccur 4 '(1 4 5 4 6 4 7 4 4)) ; works - outputs (1 5 6 7)

(define (occ E L)
  (cond
    ((null? L) 0)
    ((= (car L) E) (+ 1 (occ E (cdr L))))
    (else (occ E (cdr L)))
  )
)

(define (frequency L)
  (cond
    ((null? L) '())
    (else (cons (list (car L)(numOccur (car L) L)) (frequency (cdr L))))
  )
)

#|
(define (frequency L)
  (freq (L '()))
)

(define (freq L LL)
  (cond
    ((null? L) LL)
    (else ())
  )
)|#

#|
;Professor Jochen Lang's solution

;; Question 2b
;; Input is a List
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (frequency L)
  (if (null? L)
      '()
      (let ((LS (sort L <)))
	(let f ((RL (cdr LS))
		(E (car LS))
		(C 1))
	  (cond
	   ((null? RL) (list (list E C)))
	   ((eq? E (car RL)) (f (cdr RL) E (+ C 1)))
	   (else
            (cons (list E C) (f (cdr RL) (car RL) 1)))
	  ))))
)


(frequency  '())

(frequency '( 1 5 2 7 1 6 1 6 4))

(frequency  `(1 5 9 7 -1))
|#

(frequency '(1 5 2 7 1 6 1 6 4))

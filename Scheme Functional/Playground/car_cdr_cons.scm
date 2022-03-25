#lang scheme
(define L '(1 2 3 4 5))
(define M '(6 7 8))
(car L)
(cdr L)
(cons L M)
(cons 1 M)

(newline)

(append
  (cons (car L) '())  ; append head of L to '(9 8 7)
  '(9 8 7)
)

(newline)
#|
Note that this doesn't work because the first argument needs to be a list
(append
  (car L)
  '(9 8 7)
)
|#
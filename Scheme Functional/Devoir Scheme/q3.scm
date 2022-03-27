#|
Nom: Kien Do
CSI2520 - Paradigms de programmation Hiver 2022
Devoir 3 Scheme

Question 3
|#

#lang scheme

(define (make-string-list n)
  (cond
    ((<= n 0) '("Finished"))
    ((= n 1) (append '("1 second") (make-string-list 0)))
    (else (append (list (string-append (number->string n) " seconds")) (make-string-list (- n 1))))
  )
)
; Test cases
(make-string-list 5)
(make-string-list 10)
(make-string-list -1)
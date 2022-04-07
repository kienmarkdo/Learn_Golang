#lang scheme

#|
Exercice 3: Local Definitions
Modifiez la définition de la fonction mini-list suivante pour qu’elle n’utilise aucune fonction
auxiliaire.
Hint : Utilisez une définition locale.
|#

; Example:
;
; (min-list '(4 8 9 2 8))
; => 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (min-list x)
  (if (null? x)
      x
      (min-list-aux (car x)(cdr x))))

(define (min-list-aux e l)
  (cond
    ((null? l) e)
    ((> e (car l)) (min-list-aux (car l)(cdr l)))
    (else (min-list-aux e (cdr l)))))
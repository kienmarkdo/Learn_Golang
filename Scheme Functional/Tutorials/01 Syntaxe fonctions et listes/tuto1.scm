#lang scheme

; CSI2520: PARADIGMES DE PROGRAMMATION
; Tutorat 1: Syntaxe, fonctions et listes

"===============================  Exercice 1  ==============================="
"Quelles sont les trois façons pour déclarer une liste?"

; (x y z)
'(x y z)
(cons 'x (cons 'y (cons 'z '())))
(list 'x 'y 'z)

"===============================  Exercice 2  ==============================="
"Quel sera le résultat de :"
'x
;(list elmer fudd) ; erreur unbound identifier
(list 'elmer 'fudd)
;(elmer fudd) ; erreur unbound identifier
'(elmer fudd)
;(equal? (x) (x)) ; erreur unbound identifier
(equal? '(x) '(x))
(cons 'x '(y z))
;(cons 'x () ) ; illegal empty application
(car '(1 2 3))
(cdr (cons 1 '(2 3)))
(cons 'a (cons 'b '(c d)))
(cons 'a '(cons 'b '(c d)))
;(cons a (cons 'b '(c d))) ; unbound identifier

"===============================  Exercice 3  ==============================="
"Définissez une fonction lambda qui est la différence entre le carré de deux nombres."
((lambda (x y)
  (* (- x y) (- x y)))
  2 5)

"===============================  Exercice 4  ==============================="
"Quel est le résultat des requêtes suivantes :"
(define clam '(1 2 3))
(define octopus clam) ; clam et octopus réfère à la même liste
(eq? 'clam 'clam)
(eq? clam clam)
(eq? clam octopus)
(eq? clam '(1 2 3))
(eq? '(1 2 3) '(1 2 3))
(eq? 10 10)
(eq? 10.0 10.0)
(eqv? 10 10)
(eqv? 10.0 10.0)
(eqv? 10.0 10)
(equal? clam '(1 2 3))
(equal? '(1 2 3) '(1 2 3))

"===============================  Exercice 5  ==============================="
"Comment peut-on extraire l’élément g ci-dessous?"
;(define x (a (bc) d ( (ef) g ) )
;  (cadr (cadddr x)))

"===============================  Exercice 6  ==============================="
"Trouver la dernière cellule d'une liste. N'utilisez pas (last L)"
(define (my-last L)
  (if (or (null? L)
          (null? (cdr L))) L
  (my-last (cdr L))))
(my-last '(a b c d)) ; (d)

"===============================  Exercice 7  ==============================="
"Eliminer les répétitions consécutives dans une liste. Si une liste contient des éléments répétés"
"(consécutifs), les remplacer par une seule copie. L'ordre des éléments ne doit pas être modifié."

;compress '(a a a a b c c a a d e e e e))
;(a b c a d e)

"===============================  Exercice 8  ==============================="
"Répliquer chaque élément d'une liste un nombre donné de fois."
;(repli '(a b c) 3)
;(a a a b b b c c c)
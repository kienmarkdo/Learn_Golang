#lang scheme

#|
        CSI2520: PARADIGMES DE PROGRAMMATION
             Laboratoire 10: Scheme

Exercice 3: Lambda

Les fonctions locales, ou lambdas, sont un des ingrédients clés point la
programmation fonctionnelle. Une fonction locale est définie où elle est utilisée. En
général, la forme syntaxique des fonctions lambda est définie comme si: (lambda (var1,
var2, ...) expr1 expr2 ...). Par exemple, une fonction qui reçoit deux variables x et y qui
calcule la somme de x et y, est définie comme si: (lambda (x y) (+ x y)). Cette fonction peu
maintenant être mise à la première position de la liste:
|#

; Exemple:
; ((lambda (x y) (+ x y)) 1 2)
; => 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
((lambda (x y)  (* (+ x 2) y)) 1 2)
((lambda (x) (/ (sqrt x) 2)) 4)
((lambda (x y) (- (+ x (* y x)) (/ (* y x y x) y))) 1 2)

(define (f x) x) ; je ne comprends pas la question, "Et avec la fonction f comme entrée x∗f(x)"
((lambda (x) (* x (f x))) 2)

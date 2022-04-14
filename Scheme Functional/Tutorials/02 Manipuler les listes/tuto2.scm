#lang scheme

; CSI2520: PARADIGMES DE PROGRAMMATION
; Tutorat 2: Manipuler les listes

"1. Aplatir une structure de listes imbriquées."
"Transformer une liste, contenant potentiellement des listes comme éléments en une liste 'plate',
en remplaçant chaque liste par ses éléments récursivement."
;Exemple:
;(my-flatten '(a (b (c d) e)))
;(a b c d e)
(define (my-flatten l) (cond ((null? l) '()) ((pair? l) (append (my-flatten (car l)) (my-flatten (cdr l)))) (else (list l))))
(my-flatten '(a (b (c d) e)))

(newline)

"2. Répliquer chaque élément d'une liste un nombre donné de fois."
;Exemple:
;(repli '(a b c) 3)
;(a a a b b b c c c)
(define (repli l x) (if (null? l) '() (append (repli2 x (car l)) (repli (cdr l) x))))
(define (repli2 n x) (if (= 0 n) '() (cons x (repli2 (- n 1) x))))
(repli '(a b c) 3)

(newline)

"3. Créer une liste contenant tous les entiers dans un intervalle donné."
;Exemple:
;(range 4 9)
;(4 5 6 7 8 9)
(define (range n1 n2)
  (cond
    ((= n1 n2) (list n1))
    (else (cons n1 (range (+ n1 1) n2)))
  )
)
(range 4 9)

(newline)

"4. Supprimer le Kième élément d'une liste."
;Exemple:
;(remove-at '(a b c d) 2)
;(a c d)
(define (remove-at L num)
  (cond
    ((null? L) '())
    ((= num 1) (cdr L))
    (else (cons (car L) (remove-at (cdr L) (- num 1))))
  )
)
(remove-at '(a b c d) 2)

(newline)

"5. inserer un élément à la Kième position dans une liste."
;Exemple:
;(insert-at 'alfa '(a b c d) 2)
;(a alfa b c d)
(define (insert-at x l n) (if (= n 1) (cons x l) (cons (car l) (insert-at x (cdr l) (- n 1)))))
(insert-at 'alfa '(a b c d) 2)

(newline)

"6. Extraire un nombre donné d'éléments d'une liste, de façon aléatoire."
;Exemple:
;(rnd-select '(a b c d e f g h) 3)
;(e d a)
;Indication: Utiliser le générateur de nombres aléatoires prédéfini
(define (rnd-select l n)
  (let
    ((x (+ (random (length l)) 1)))
    (if (= n 0)
        '()
        (cons (list-ref l (- x 1)) (rnd-select (remove-at l x) (- n 1)))
    )
  )
)
;(define (remove-at l n) (if (= n 1) (cdr l) (cons (car l) (remove-at (cdr l) (- n 1))))) ; remove-at is already defined
(rnd-select '(a b c d e f g h) 3)

(newline)

"7. Générer une permutation aléatoire des éléments d'une liste."
;Exemple:
;(rnd-permu '(a b c d e f))
;(b a d c e f)
(define (rnd-permu l) (if (= 0 (length l)) '() (let ((x (+ (random (length l)) 1))) (cons (list-ref l (- x 1)) (rnd-permu (remove-at l x))) )))
;(define (remove-at l n) (if (= n 1) (cdr l) (cons (car l) (remove-at (cdr l) (- n 1))))) ; remove-at is defined up there
(rnd-permu '(a b c d e f))
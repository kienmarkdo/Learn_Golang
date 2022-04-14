#lang scheme

;CSI2520: PARADIGMES DE PROGRAMMATION
;Tutorat 3: Map et autres exemples

"1. Transposition"
"Utiliser la fonction map afin de définir la fonction transpose qui accepte une liste de pairs et
retourne une pair de listes"
(define transpose
 (lambda (ls)
 (cons (map car ls) (map cdr ls))))


"2. Création d’une liste répétitive"
"Définir la fonction make-list acceptant un entire positif n et un object et qui retourne une liste de
longueur n consitué du meme objet"
(define make-list
 (lambda (n x)
 (if (= n 0)
 '()
 (cons x (make-list (- n 1) x)))))


"3. Comparer deux listes"
"Définir une fonction shorter qui retourne la plus courte de deux listes. Défi: vous ne devez pas
utiliser la function length"
(define shorter?
 (lambda (ls1 ls2)
 (and (not (null? ls2))
 (or (null? ls1)
 (shorter? (cdr ls1) (cdr ls2))))))
(define shorter
 (lambda (ls1 ls2)
 (if (shorter? ls2 ls1)
 ls2
 ls1)))


"4. Extraire des éléments"
"Définir une fonction sub permettant d’extraire une sous-liste comme suit :"
(define (sub L start stop ctr)
; extract elements start to stop into a list
 (cond ( (null? L) L)
 ( (< ctr start) (sub (cdr L) start stop (+ ctr 1)))
 ( (> ctr stop) '() )
 (else (cons (car L)
 (sub (cdr L) start stop (+ ctr 1))) ) ) )


"5. Division de listes"
"Écrire une fonction permettant de diviser une liste en deux"
(define (split L)
; division de la liste en 2:
; retourne ((1ere moitié)(2nde moitié))
 (let ((len (length L)))
 (cond ((= len 0) (list L L) )
 ((= len 1) (list L '() ))
 (else (list (firstHalf L (/ len 2))
 (lastHalf L (/ len 2)))))))
(define (firstHalf L N)
 (if (= N 0)
 null
 (if (or (= N 1) (< N 2))
 (list (car L))
 ;else
 (cons (car L) (firstHalf (cdr L) (- N 1))))))
(define (lastHalf L N)
 (if (= N 0) L
 (if (or (= N 1) (< N 2))
 (cdr L)
 ;else
 (lastHalf (cdr L) (- N 1)))
))

  
"6. Fusion de listes"
"Écrire une fonction mergelists permettant de fusionner deux listes ordonnées"
(define (mergelists L M)
; supposer L et M déjà triés
 (cond ( (null? L) M)
 ( (null? M) L)
 ( (< (car L)(car M)) (cons (car L)
 (mergelists (cdr L)M)))
 (else (cons (car M) (mergelists L (cdr M)))) ) )
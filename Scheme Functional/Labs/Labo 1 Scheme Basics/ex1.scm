#lang scheme

#|
        CSI2520: PARADIGMES DE PROGRAMMATION
             Laboratoire 10: Scheme

Exercice 1: Calculatrice

Commencez une session interactive de Scheme en DrRacket. Notez que vous devez vous assurer
que dans votre fenêtre de programmation (d'habitude celle du haut) contient #lang racket. La
syntaxe pour Scheme exige que tout soit une liste. Une liste est placée entre des parenthèses
rondes. Le premier élément d'une liste est spécial et s'il n'est pas précédé d’une apostrophe,
compte comme le nom de la fonction. Par exemple avec la fonction +:
|#

; Exemple: Addition en Scheme.
;
; (+ 4 9)
; => 13
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(/ 3 4)
(expt 2 8)
(* 2.5 3.3)
(+ 3 (/ (+ (* 4 4) 2) 6))
(/ (sqrt 2) 2)
(+ 4 2 4 5)
(/ 3 4 2)
(* (+ 3 5) 4)
(/ (* 2 (log 2 2)) (* 2 (expt 3 3)))
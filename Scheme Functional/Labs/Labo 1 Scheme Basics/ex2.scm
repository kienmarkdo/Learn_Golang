#lang scheme

#|
        CSI2520: PARADIGMES DE PROGRAMMATION
             Laboratoire 10: Scheme

Exercice 2: Forme Syntaxique Spéciale: Apostrophe

Il y a des exceptions à la forme syntaxique générale de listes avec des fonctions
comme première entrée dans Scheme. Une de ces exceptions est avec les apostrophes
qui sont utile pour utiliser des listes comme des structures de données. Considérez
ceci:
|#

; Utilisant une apostrophe.
;
; Exemple:
; (quote (+ 1 2))
; => (+ 1 2)
; Ou:
; '(+ 1 2)
; => (+ 1 2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

'(1 2 3 4 5 6 7 8 9 10)
; je ne comprends pas la question, "Créer une liste qui contient des nombres flottant et à virgule fixe"
(list + - * /)
'(2 * (log 2 2) * (expt 3 3))
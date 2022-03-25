#lang scheme

; Scheme Data Types, predicates, and Mathematical Operations
; https://www.youtube.com/watch?v=gErFSiMQyKU&list=PLm8dSOaqLPHKVPwBkk9UeAB2Lokl1xMJM&index=5

"Data types"
1                  ; integer
3.4                ; real numbers / float
"Hello world"      ; string
*                  ; primative
#t                 ; boolean true
#f                 ; boolean false
#\A                ; characters

(newline)

"Symbols & Strings"
; a symbol is like an immutable string (from Racket's official documentation https://docs.racket-lang.org/reference/symbols.html)
(symbol? "Hello")  ; ask if "Hello" is a symbol and returns true or false
(symbol? 'World)
(string? "Hello")
(string? 'World)
(symbol->string 'hello) ; convert symbol to string
(string->symbol "World")
(symbol? 5)
(symbol? '5)
(symbol? 'lTwoIII)

(newline)

"Numeric data types:"
3                  ; integer
#b101              ; binary
#o101              ; octal
#x101              ; hexadecimal
12.3               ; real
7/3                ; fraction
4+2i               ; imaginary

(newline)

"Number predicates"
(integer? 3)
(integer? 3.0)
(integer? 3.1)
(integer? (* 3 1/3))
(integer? (* 3 (/ 1 3)))

"Real"
(real? 3)
(real? 3.0)
(real? 2+i)
(real? 2+0i)

"Other"
(rational? 1/3)
(rational? (/ 1 3))
(complex? 2+i)
(complex? 2+0i)
(complex? 2)
(rational? 2+0i)

(newline)

(number? 3)
(number? 2+i)
(number? (car '(8 10 5))) ; ask if "the car of the list (8 10 5)" is a number. NOTE: car is a keyword in Scheme
(number? "One")
(number? 'Two)
(number? '3)

(newline)
"Math"
(+ 10 10)
(* 10 10)
(+ 1 2)
(* 3 4)
(- -1)
(+ 1 2 3 4 5 6 7 8 9 10)
(* 1 2 3 4 5 6 7 8 9 10)
(- 1 2 3 4 5 6 7 8 9 10)
(/ 100 2 5)
(- 100 (+ (/ 10 5) (* 2 3))) ; 100 - (10/5 + 2*3)
(sqrt 9)
(sqrt 20)
(sqrt -1)
(/ 17 3)             ; 5 2/3
(/ 17 3.0)           ; 5.666666666666667
(quotient 17 3)      ; 5
(remainder 17 3)     ; 2
(modulo 17 3)        ; 2
(remainder -17 3)    ; -2
(modulo -17 3)       ; 1

(newline)
"Define x, y, z"
(define x 10)
(define y 20)
(define (z) 30)
x
y
z                    ; #<procedure:z> . We will be defining procedures with lambdas, not with this. This is syntactic sugar.
(z)
(+ 2 x)
(+ x 2)
(* x (/ y 6))
(= x 12)             ; equality symbol, NOT (re)assignment symbol
(= 30 (z))           ; (= 30 z) is an error because z is a procedure, not an integer. Must do this, (= 30 (z))
(> x (* y 3))        ; evaluates x > y * 3

(newline)
"Equality checking"
(define num 8)
"="                  ; equality to compare NUMBERS
(= 32 32)
(= 32 (* 4 num))
(= 8 num)
"eq?"                ; equality to compare SYMBOLS and STRINGS - also works with numbers
(eq? 'Hello 'Hello)
(eq? "Hello" "Hello")
(eq? "CSI" (symbol->string 'CSI))   ; this will be FALSE. Both are the same string, BUT they are not the same INSTANCE of the same string. So, don't do this.
(eq? '(1 2 3) '(1 2 3))
(eq? 8 (+ 2 3 3))
(eq? num (+ 2 3 3))
"equal?"              ; ALL OF THESE BELOW ARE TRUE. It doesn't just check whether the objects are the same, they are checking to see if the actual values are the same or not
                      ; it's similar to compare by reference vs compare by value. equal? is compare by value.
(equal? 'Hello 'Hello)
(equal? "Hello" "Hello")
(equal? "CSI" (symbol->string 'CSI))
(equal? '(1 2 3) '(1 2 3))
(equal? 8 (+ 2 3 3))
(equal? num (+ 2 3 3))
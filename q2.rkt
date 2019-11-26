#lang racket
(provide infixToPostfix)

; function that gives the precedence of an operator
(define (precedence operator)
    (cond
        [(equal? operator #\() 0]
        [(equal? operator #\+) 1]
        [(equal? operator #\-) 1]
        [(equal? operator #\*) 2]
        [(equal? operator #\/) 2]
    )
)

;infix to postfix converting function
(define (infixToPostfix lst)
    (define (conv expression stack ans)
        (cond
            [(empty? expression) (append (reverse ans) stack)]
            [(number? (first expression)) (conv (rest expression) stack (cons (first expression) ans))]
            [(empty? stack) (conv (rest expression) (cons (first expression) stack) ans)]
            [(equal? (first expression) #\() (conv (rest expression) (cons (first expression) stack) ans)]
            [(equal? (first expression) #\))
                (cond
                    [(equal? (first stack) #\() (conv (rest expression) (rest stack) ans)]
                    [else (conv expression (rest stack) (cons (first stack) ans))]  
                )
            ]
            [(< (precedence (first stack)) (precedence (first expression))) (conv (rest expression) (cons (first expression) stack) ans)]
            [else (conv expression (rest stack) (cons (first stack) ans))]
        )
    )
    (conv lst '() '())
)
;(infixToPostfix (list 1 2 3 4))
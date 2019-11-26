#lang racket
(provide evalPostfixExpr)

(define (compute operator stack)
   (cons (operator (second stack) (first stack)) (rest (rest stack)))
)

(define (evalPostfixExpr lst)
    (define (eval expression stack)
        (cond
            [(empty? expression) (first stack)]
            [(number? (first expression)) (eval (rest expression) (cons (first expression) stack))]
            [(equal? (first expression) #\+) (eval (rest expression) (compute + stack))]
            [(equal? (first expression) #\-) (eval (rest expression) (compute - stack))]
            [(equal? (first expression) #\*) (eval (rest expression) (compute * stack))]
            [(equal? (first expression) #\/) (eval (rest expression) (compute / stack))]
        )
    )
    (eval lst '())
)

;(evalPostfixExpr '(1 2 3 #\* #\+))
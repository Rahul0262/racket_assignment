#lang racket

(provide sumUpRecursive sumUpTailRecursion)
(require racket/trace)

(define (sumUpRecursive l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sumUpRecursive (rest l)))]))


(define (sumUpTailRecursion lst ac)
  (cond
    [(empty? lst) ac]
    [else (sumUpTailRecursion (rest lst) (+ ac (first lst)))]))

;(trace sumUpRecursive sumUpTailRecursion)

;(sumUpRecursive '(1 2 3 4))
;(sumUpTailRecursion '(1 2 3) 0)
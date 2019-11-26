#lang racket

(require racket/trace)
(require "q1.rkt")

(define sumUpR sumUpRecursive)
(define sumUpRT sumUpTailRecursion)

(trace sumUpR sumUpRT)

(sumUpR (list 1 2 3 4 5))
(sumUpRT (list 1 2 3 4 5) 0)
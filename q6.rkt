#lang racket
(require "q5.rkt")

(define (isLeaf node)
    (empty? (rest node))
)

(define (printPathsTailRecursive node)
    (define (localTailRecursive node sofar)
        (let ([revPath (cons (first node) sofar)])
            (cond
                [(isLeaf node) (println (reverse revPath))]
                [else
                    (for ([child (rest node)])
                        (localTailRecursive child revPath)
                    )
                ]
            )
        )
    )
    (localTailRecursive node '())
)

(define (printPathsRecursive node)
    (define (localRecursive node)
        (cond
            [(isLeaf node) (list (list (first node)))]
            [else
                (for/fold ([paths '()])
                    ([child (rest node)])
                    (append paths
                        (for/list ([path (localRecursive child)])
                            (cons (first node) path)
                        )
                    )
                )
            ]
        )
    )
    (for ([path (localRecursive node)])
        (println path)
    )
)


(define root
    (makeTree 1
        (makeTree 2
            (makeTree 6)
            (makeTree 7
                (makeTree 8)
            )
        )
        (makeTree 3
            (makeTree 9
                (makeTree 10)
                (makeTree 11)
            )
        )
        (makeTree 4)
        (makeTree 5)
    )
)

(printPathsRecursive root)
(newline)
(printPathsTailRecursive root)
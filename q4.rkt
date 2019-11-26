#lang racket

; Merge Sort -> takes T(N) time
(define (mergesort lst)
    (if (= (length lst) 1)
        lst
        ; Function Merge takes O(N) time
        (merge
            ; Each of these following 2 merge sort takes T(N/2) time
            ;input can be halved O(log(N)) times only
            (mergesort (firstHalf lst (quotient (length lst) 2)))
            (mergesort (secondHalf lst (quotient (length lst) 2)))
        )
    )
)


; T(N) = 2*T(N/2) + O(N)  = O(NlogN)
; Returns first half of the list
(define (firstHalf lst length)
    (if (zero? length)
        (list)
        (append (list (car lst)) (firstHalf (cdr lst) (- length 1)))
    )
)

; Returns second half of the list
(define (secondHalf lst length)
    (if (zero? length)
        lst
        (secondHalf (cdr lst) (- length 1))
    )
)

; Merges two sorted sub lists in O(list length)
;Complexity of merge function = O(N)
(define (merge firstHalf secondHalf)
    (cond
        [(null? firstHalf)
            secondHalf
        ] ;if firstHalf is empty, return secondHalf
        [(null? secondHalf)
            firstHalf
        ] ;if secondHalf is empty, return firstHalf
        [(< (car firstHalf) (car secondHalf))
            (append (list (car firstHalf)) (merge (cdr firstHalf) secondHalf))
        ] ;if the head of list firstHalf is bigger than head of list secondHalf"
        [else
            (append (list (car secondHalf)) (merge firstHalf (cdr secondHalf)))
        ]
    )
)

;(mergesort '(1 2 7 4 0 1 5))
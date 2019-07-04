#lang racket

;; is number contained in sequence?
;; list number -> boolean
(define (binary-search l v)
  (let ([size (length l)])
    (cond
      [(= 0 size) #f]
      [(= 1 size) (if (= (first l) v) #t #f)]
      [else (let* ([midpoint (quotient size 2 )]
                   [midpoint-value (list-ref l midpoint)])
              (cond
                [(= midpoint-value v) #t]
                [(> midpoint-value v) (binary-search (take l midpoint) v)]
                [else                 (binary-search (drop l midpoint) v)]))])))

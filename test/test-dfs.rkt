#lang racket

(require rackunit)

(require "../racket-algos/dfs.rkt")
(require "../racket-algos/graph.rkt")

(define v1 (vertex 1 #f '(2 3)))
(define v2 (vertex 2 #f '(4 3)))
(define v3 (vertex 3 #f '(5)))
(define v4 (vertex 4 #f '(6)))
(define v5 (vertex 5 #f '(4 6)))
(define v6 (vertex 6 #f '()))

(define g (list v1 v2 v3 v4 v5 v6))



(check-equal?
 (dfs g)
 '(1 2 4 6 3 5))

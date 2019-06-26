#lang racket

(require rackunit)

(require "../racket-algos/merge-sort.rkt")


(check-equal?
 (merge-sort '(4 2 34 1 34 51 41 42 1243 1243))
 '(1 2 4 34 34 41 42 51 1243 1243))


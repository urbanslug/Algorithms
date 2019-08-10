#lang racket

(require rackunit)

(require "../racket-algos/binary-search.rkt")

(check-equal? (binary-search '(1 2 3 4 5) 3) #t)
(check-equal? (binary-search '(1 2 3 4 5) 7 ) #f)



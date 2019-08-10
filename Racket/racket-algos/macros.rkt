#lang racket

(define-syntax foo
  (lambda (stx)
    (syntax "I am foo")))

(define-syntax (also-foo stx)
  (syntax "I am also foo"))

(define-syntax (say-hi stx)
  #'(displayln "I am also foo"))

(define g 1)
(define h 2)


(define-syntax-rule (swap x y)
  (let ([tmp x])
    (set! x y)
    (set! y tmp)))

(swap g h)

#lang racket

(require "./graph.rkt")

(provide get-node
         unique-append
         not-empty?
         list-member?
         tuple
         tuple-f
         tuple-s)



(define (get-node g id)
  (findf (lambda (n) (= id (vertex-id n))) g))


(define unique-append (compose remove-duplicates append))


(define (list-member? lst v)
  (let ([membership? (member v lst)])
    (if membership? #t #f)))


(define not-empty? (compose not empty?))

(struct tuple (f s) #:transparent)

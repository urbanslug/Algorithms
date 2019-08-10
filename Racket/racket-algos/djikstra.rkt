#lang racket

(require "./graph.rkt")

(define (get-cost n)
  void)

(define (c f s)
  void)

;; takes nodes u and v
(define (relax u v)
  (let ([du (get-cost u)]
        [dv (get-cost v)])
    (if (< (+ du c(u v)) dv)
        (update-cost dv (+ du c(u v)))
        dv)))

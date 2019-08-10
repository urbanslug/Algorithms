#lang racket

(provide vertex
         vertex-id
         vertex-edges
         vertex-cost)


;; We will create a graph out of an association list
;; Example vertex
(struct vertex (id cost edges) #:transparent)

;; empty list
(define empty-graph empty)

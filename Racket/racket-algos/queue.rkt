#lang racket

(require "./utils.rkt")

(provide empty-queue
         enqueue-multiple
         enqueue
         dequeue)

(define empty-queue (list))

(define (enqueue-multiple q l)
  (foldl
   (lambda (v accum) (enqueue accum v))
   q
   l))


(define (enqueue q v)
  (cons v q))

(define (dequeue q)
  (tuple
   (last q)
   (take q (- (length q) 1))))




;; test
;(enqueue-multiple empty-queue '(1 2 3 4 5 6))
;(dequeue (enqueue-multiple empty-queue '(1 2 3 4 5 6)))

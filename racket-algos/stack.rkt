#lang racket

(provide empty-stack
         push
         push-multiple
         pop)



(define empty-stack empty)


;; push a list of values into the stack at once
(define (push-multiple s* l)
  (foldl (lambda (v s) (push s v))
         s*
         l))


(define (push s v)
  (append s (list v)))


;; returns value and the updated stack
(define (pop s)
  (values
   (last s)
   (take s (- (length s) 1))))

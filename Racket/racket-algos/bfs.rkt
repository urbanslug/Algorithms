#lang racket

(require "./graph.rkt"
         "./utils.rkt"
         "./queue.rkt")

(define (bfs graph [current-node #f] [queue empty-queue] [spanning-tree (list)])
  (cond
    [(false? current-node)
     (bfs
      graph
      (first graph)
      (enqueue queue (vertex-id (first graph)))
      (append spanning-tree (list (vertex-id (first graph)))))]

    [(not-empty? queue)
     (display current-node)
     (display "        => ")
     (displayln queue)
     

     (let* ([q* (if (= (vertex-id current-node) (tuple-f (dequeue queue)))
                    (tuple-s (dequeue queue))
                    queue)]
            [adj (vertex-edges current-node)]

            ;; remove explored from adj
            [adj-without-explored
             (filter (lambda (x) (not (list-member? spanning-tree x))) adj)]
            [updated-q (enqueue-multiple q* adj-without-explored)]
            [updated-spanning-tree (unique-append spanning-tree adj)])
       (bfs
        graph
        (get-node graph (tuple-f (dequeue updated-q)))
        (if (empty? (tuple-s (dequeue updated-q)))
            updated-q
            (tuple-s (dequeue updated-q)))
        updated-spanning-tree))]
    [else spanning-tree]))

(define v1 (vertex 1 #f '(4 2)))
(define v2 (vertex 4 #f '(3)))
(define v3 (vertex 3 #f '(10 9)))
(define v4 (vertex 2 #f '(3 8)))
(define v5 (vertex 8 #f '(7 5)))
(define v6 (vertex 7 #f '(5)))
(define v7 (vertex 5 #f '(6)))
(define v8 (vertex 6 #f '()))





(define g (list v1 v2 v3 v4 v5 v6 v7 v8))

(bfs g)




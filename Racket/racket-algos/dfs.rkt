#lang racket

(require "./graph.rkt"
         "./stack.rkt"
         "./utils.rkt")

(provide dfs)

;; set of visited node IDs
;(define dfs-spanning-tree (set))

;; given a node find the next unexplored node
;; a list of node ids that could be empty
(define (next-unexplored-nodes n spanning-tree)
  (filter
   (lambda (n*) (not (list-member? spanning-tree n*)))
   (vertex-edges n)))


;; I want spanning tree as a list because it maintains order
(define (dfs graph [current-node #f] [stack empty-stack] [spanning-tree (list)])
  (cond
    [(false? current-node)
     (let* ([new-current-node (first graph)]
           [updated-spanning-tree
            (unique-append spanning-tree (list (vertex-id new-current-node)))])
       (dfs
        graph
        new-current-node
        stack
        updated-spanning-tree))]

    [(and (list-member? spanning-tree (vertex-id current-node))
          (not-empty? (next-unexplored-nodes current-node spanning-tree)))
     (let* ([next-unexplored-id
             (first (next-unexplored-nodes current-node spanning-tree))]
            [next-unexplored (get-node graph next-unexplored-id)]
            [updated-spanning-tree
             (unique-append  spanning-tree (list next-unexplored-id))])
       (dfs
        graph
        next-unexplored
        (push stack (vertex-id current-node))
        updated-spanning-tree))]

    ;; backtrack and search
    [(and (list-member? spanning-tree (vertex-id current-node))
          (empty? (next-unexplored-nodes current-node spanning-tree))
          (not-empty? stack))
     (let-values ([(popped-id s*) (pop stack)])
       (dfs
        graph
        (get-node graph popped-id)
        s*
        spanning-tree))]
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

(dfs g)


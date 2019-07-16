#lang racket

(require "./graph.rkt"
         "./stack.rkt")


(provide dfs)

;; set of visited node IDs
(define dfs-spanning-tree (set))

(define (list-member? lst v)
  (let ([membership? (member v lst)])
    (if membership? #t #f)))

(define (not-empty?)
  (lambda (x) (not (empty? x))))

;; given a node find the next unexplored node
;; a list of node ids that could be empty
(define (next-unexplored-nodes n spanning-tree)
  (filter
   (lambda (n*) (not (list-member? spanning-tree n*)))
   (vertex-edges n)))

(define (get-node g id)
  (findf
   (lambda (n) (= id (vertex-id n)))
   g))

;; I want spanning tree as a list because it maintains order
(define (dfs graph [current-node #f] [stack empty-stack] [spanning-tree (list)])
  (cond
    [(false? current-node)
     (let ([new-current-node (first graph)])
       (dfs
        graph
        new-current-node
        stack
        (remove-duplicates (append spanning-tree (list (vertex-id new-current-node))))))]

    [(and (list-member? spanning-tree (vertex-id current-node))
          (not (empty? (next-unexplored-nodes current-node spanning-tree))))
     (let* ([next-unexplored-id (first (next-unexplored-nodes current-node spanning-tree))]
           [next-unexplored (get-node graph next-unexplored-id)])
       (dfs
        graph
        next-unexplored
        (push stack (vertex-id current-node))
        (remove-duplicates (append spanning-tree (list next-unexplored-id)))))]

    ;; backtrack and search
    [(and (list-member? spanning-tree (vertex-id current-node))
          (empty? (next-unexplored-nodes current-node spanning-tree))
          (not (empty? stack)))
     (let-values ([(popped-id s*) (pop stack)])
       (dfs
        graph
        (get-node graph popped-id)
        s*
        spanning-tree))]
    [else spanning-tree]))

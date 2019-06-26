#lang at-exp racket


(require scribble/srcdoc
         (for-doc racket/base scribble/manual))


(provide (proc-doc/names merge (-> list? list? list?) (left right) @{Some other stuff}))

(define (merge left right [accum empty])
  (cond [(and (empty? left) (empty? right)) ;; base case
         accum]

        [(empty? left)
         (merge empty empty (append accum right))]

        [(empty? right)
         (merge empty empty (append accum left))]

        [else
         (let ([i (first left)]
               [j (first right)])
           (if (< i j)
               (merge (rest left) right (append accum (list i)))
               (merge left (rest right) (append accum (list j)))))]))

(define (split-in-half l)
  (let-values ([(left right) (split-at l (quotient (length l) 2))])
    (values left right)))


(provide (proc-doc/names merge-sort (-> list? list?) (l) @{Some stuff}))


(define (merge-sort l)
  (let ([len (length l)])
    (if (<= len 1)
        l
        ;; recursive-split
        (let-values ([(left right) (split-in-half l)])
          (merge
           (merge-sort left)
           (merge-sort right))))))

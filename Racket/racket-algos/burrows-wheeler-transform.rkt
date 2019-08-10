#lang racket

;; move the first character to the end of the string
(define/contract (rotate-string str)
  (string? . -> . string?)
  (let ([head (string-ref str 0)]
        [tail (substring str 1)])
    (~a tail head)))


;; Generate an unsorted Burrows-Wheeler Matrix
(define/contract (gen-bwm s [bwt-list empty])
  (-> string? list?)
  (if (char=? (string-ref s 0) #\$)
      bwt-list
      (if (empty? bwt-list)
          (let ([dollar-s (~a s "$")])
            (gen-bwm dollar-s (list dollar-s)))
          (let* ([s* (rotate-string s)]
                 [bwt-list* (append bwt-list ( list s*))])
            (gen-bwm s* bwt-list*)))))

(define/contract (sort-bwm bwt-list)
  (list? . -> . list?)
  (sort bwt-list string<=?))

;; string -> list of strings
(define sorted-bwm (compose sort-bwm gen-bwm))

;; list of strings -> string
(define (extract-bwt sorted-bwm*)
  ((compose list->string map)
   (lambda (s) (string-ref s (sub1 (string-length s))))
   sorted-bwm*))

;; ignore spaces for now

;; string -> string
;; BWT brings like characters together in runs because it sorts by
;; right context i.e. the text that comes right after the,
(define bwt (compose extract-bwt sorted-bwm))
(bwt "Tomorrow and tomorrow and tomorrow")

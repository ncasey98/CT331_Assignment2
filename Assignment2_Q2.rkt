#lang racket

(provide ins_beg)

(define (ins_beg el lst)
  (cons el lst)
  )

(provide ins_end)

(define (ins_end el lst)
  (append lst el)
  )

(provide cout_top_level)

(define (cout_top_level lst)
  (define el 0)
  (define (count symbol)
    (if (empty? symbol)
        (display "Items in the list = ")
        (begin
          (set! el (+ el 1))
          (count (rest symbol)))))
  (count lst)
  (display el)
  )

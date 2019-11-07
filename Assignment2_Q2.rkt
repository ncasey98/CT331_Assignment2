#lang racket

(provide ins_beg)

(define (ins_beg el lst)
  (cons el lst)
  )

(provide ins_end)

(define (ins_end el lst)
  (append lst el)
  )

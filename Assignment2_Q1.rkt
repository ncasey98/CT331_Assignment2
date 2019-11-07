#lang racket

(cons 1 2)

(cons 1 (cons 2 (cons 3 '())))

(cons "one" (cons 2 (cons (cons 1 (cons 2 (cons 3 '()))) '())))

(list "one" 2 (list 1 2 3))

(append '("one" 2) '((3 4 5)))
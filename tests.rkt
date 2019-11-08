#lang racket

(require (file "Assignment2_Q2.rkt"))

; This structure allows a single function call
; to run every test in sequence, rather than
; calling each function separately.

(define (runTests)
  (begin
    (display "Running tests..\n")
    ; Begin calling test functions
    (printf "1: ~a\n" (ins_beg 1 '(2 3 4)))
    (printf "2: ~a\n" (ins_beg "a" '("b" "c" "d")))
    (printf "3: ~a\n" (ins_beg 1 '("bc" 3 "de")))
    (printf "4: ~a\n" (ins_end 4 '(1 2 3)))
    (printf "5: ~a\n" (ins_end 'd '(a b c)))
    (printf "6: ~a\n" (ins_end 3 '("1" 2)))
    (printf "7: ") (cout_top_level '("a" '("b" "c" "d") "c"))
    (printf "\n8: ") (cout_top_level '("hello" ("my" "name" "is")))
    (printf "\n9: ") (cout_top_level '(1 2 (3 4) 5 6)) 
    ; End calling test functions
    (display "\nTests complete!\n")))

; Begin test functions
;(define (test_ins_beg1)
;  (eq? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))
; End test functions

; Run the tests
(runTests)
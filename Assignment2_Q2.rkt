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

(provide count_instances)

(define (count_instances el lst)
  (define lst_el 0)
  (define (count symbol)
    (if (empty? symbol)
        (display "Finished! Instances in list = ")
        (begin
          (if (eq? el (first symbol))
              (set! lst_el (+ lst_el 1))
          (set! lst_el lst_el))
          (count (rest symbol)))))
  (count lst)
  (display lst_el))

(provide count_instances_tr)

(define (count_instances_tr el lst)
  (define (count_tr symbol totalSymbol)
    (if (empty? symbol)
     (begin
        (display "Finished! Instances in list = ")
        (display totalSymbol))
    (begin
      (if (eq? el(first symbol))
          (count_tr (rest symbol) (+ totalSymbol 1))
          (count_tr (rest symbol) totalSymbol)))))
(count_tr lst 0)
  )

(provide count_instances_deep)

(define (count_instances_deep el lst)
  (define lst_el 0)
  (define (count symbol)
    (if (empty? symbol)
        (void)
        (begin
          (if (eq? el (first symbol))
              (begin
                (set! lst_el (+ lst_el 1))
                (count (rest symbol)))
              (begin
                (if (number? (first symbol))
                    (count (rest symbol))
                    (begin
                      (count (first symbol))
                      (count (rest symbol)))))))))
    (count lst)
    (display "Finished! Instances in list = ")
    (display lst_el)
    )
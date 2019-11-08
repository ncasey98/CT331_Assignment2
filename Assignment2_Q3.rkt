#lang racket

; Define structure of BST
(provide leftChild)
(define (leftChild BST)
  (car BST))

(provide rightChild)
(define (rightChild BST)
  (caddr BST))

(provide value)
(define (value BST)
  (cadr BST))

(provide inOrder)
  (define inOrder
     (match-lambda
       [`(() ,el ()) `(,el)]
       [`(,left ,el ()) (append (inOrder left) `(,el))]
       [`(() ,el ,right) (append `(,el) (inOrder right))]
       [`(,left ,el ,right) (append (inOrder left) `(,el) (inOrder right))])
    )

; (A)
(provide sorted)
(define (sorted BST)
  (begin
    (cond [(not (empty?(leftChild BST))) (sorted (leftChild BST))])
    (printf "~a " (value BST))
    (cond [(not (empty?(rightChild BST))) (sorted (rightChild BST))]))
  )

; (B)
(provide findItem)
(define (findItem item BST)
  (cond
    [(null? BST) #f]
    [(equal? item (value BST)) #t]
    [(< item (value BST)) (findItem item (leftChild BST))]
    [(> item (value BST)) (findItem item (rightChild BST))])
  )

; (C)
(provide insertItem)
     (define insertItem
          (match-lambda**
           [(el '()) `(() ,el ())]
           [(el '(() () ())) `(() ,el ())] 
           [(el `(,left ,item ,right)) #:when (<= el item) `(,(insertItem el left) ,item ,right)]
           [(el `(,left ,item ,right)) `(,left ,item ,(insertItem el right))])
       )

; (D)
(provide insertList)
(define (insertList BST lst)
  (if (empty? lst) BST
      (insertList (insertItem BST (car lst)) (cdr lst)))
  )

; (E)
(provide treeSort)
      (define (treeSort lst)
         (define treeSortItration
           (match-lambda**
            [(el `()) (inOrder el)]
            [(el `(,a . ,b)) (treeSortItration (insertItem a el) b)]
            [(_ _) "incorrect arguments or broken tree"]))
         (treeSortItration '(() () ()) lst))

; F
;(provide treeSortHigher)
;  (define (treeSortHigher lst)
;    
;    )
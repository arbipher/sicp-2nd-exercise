(define (fast-exp b n)
  (fast-exp-iter b n 1))

(define (fast-exp-iter b n product)
  (cond ((= n 0) product)
      	((even? n) (fast-exp-iter (square b) (/ n 2) product))
        (else (fast-exp-iter (square b) (/ (- n 1) 2) (* product b)))
  )
)

(fast-exp 2 4)
(fast-exp 2 5)
(fast-exp 2 6)
(fast-exp 2 7)
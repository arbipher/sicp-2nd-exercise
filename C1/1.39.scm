(define (cont-frac n d k)
  (define (cont-fact-iter result i)
    (if (= i 0)
      result
      (cont-fact-iter (/ (n i) (- (d i) result)) (- i 1))
    )
  )
  (cont-fact-iter (/ (n k) (d k)) (- k 1))
)

(define (tan-cf x k)
  (/ 
    (cont-frac
      (lambda (a) (square x))
      (lambda (a) (- (* 2 a) 1))
      k
    )
    x
  )
)

(tan-cf 0.7854 200)
;0.7854 = pie / 4 = 45 degree
;tan 45degree = 1
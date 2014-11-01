(define (cont-frac n d k)
  (define (cont-fact-iter result i)
    (if (= i 0)
      result
      (cont-fact-iter (/ (n i) (+ (d i) result)) (- i 1))
    )
  )
  (cont-fact-iter (/ (n k) (d k)) (- k 1))
)

(cont-frac
  (lambda (i) 1.0)
  (lambda (i) 
    (if (= (modulo i 3) 2)
      (* 2 (/ (+ i 1) 3))
      1
    )
  )
  100
)
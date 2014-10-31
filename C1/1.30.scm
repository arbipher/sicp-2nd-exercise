(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

(define (inc n)
  (+ n 1)
)

(define (id x)
  x)

(sum id 1 inc 100)

(define (integral f a b dx)
  (define (add-dx x)
  	(+ x dx))
  (define half-dx (/ dx 2.0))
  (* (sum f (+ a half-dx) add-dx b)
  	  dx)
)

(integral sin 0 3.1415926 0.01)
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)

(define (inc n)
  (+ n 1)
)

(define (id x)
  x)

(define (factorial n)
  (product id 1 inc n))

(factorial 10)

(define (pie t)
  (define (next a) (+ a 2))
  (define (f x)
    (*
      (/ (+ x 1) x)
      (/ (- x 1) x)
    )
  )
  (* (product f 3.0 next t) 4)
 )

(pie 100)
(pie 1000)
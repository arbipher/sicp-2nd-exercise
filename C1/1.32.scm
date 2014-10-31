(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))
	)
  )
  (iter a null-value)
)

(define (accumulate-rcs combiner null-value term a next b)
  (define (rsc a)
    (if (> a b)
      null-value
      (combiner (term a) (rsc (next a)))
	)
  )
  (rsc a)
)


(define (inc n)
  (+ n 1)
)

(define (id x)
  x)

(define (sum term a next b)
  (accumulate + 0 term a next b)
)

(define (product term a next b)
  (accumulate * 1 term a next b)
)

(define (sum-rcs term a next b)
  (accumulate-rcs + 0 term a next b)
)

(define (product-rcs term a next b)
  (accumulate-rcs * 1 term a next b)
)


(sum id 1 inc 10)
(product id 1 inc 10)

(sum-rcs id 1 inc 10)
(product-rcs id 1 inc 10)
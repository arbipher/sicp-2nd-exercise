(define (filtered-accumulate combiner null-value predicate term a next b)
  (define (filter x)
    (if (predicate x)
      (term x)
      null-value
    )
  )
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (filter a)))
	  )
  )
  (iter a null-value)
)

(define (prime? n)
  (= (smallest-divisor n) n)
)

(define (smallest-divisor n)
  (find-divisor n 2)
)

(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n)
      n)
    ((= (modulo n test-divisor) 0)
      test-divisor)
    (else
      (find-divisor n (+ test-divisor 1)))
  )
)

(define (inc n)
  (+ n 1)
)

(define (id x)
  x)

(define (sum-sqaure-prime a b)
  (filtered-accumulate + 0 prime? square a inc b)
)

(define (product-odd term a next b)
  (filtered-accumulate * 1 odd? term a next b)
)

(sum-sqaure-prime 2 20)
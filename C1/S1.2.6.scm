(define (expmod base exp m)
	(modulo (expt base exp) m)
)

(define (expmod-r base exp m)
	(cond
		((= exp 0) 1)
		((even? exp)
			(modulo (square (expmod-r base (/ exp 2) m)) m)
		)
		(else
			(modulo (* base (expmod-r base (- exp 1) m)) m)
		)
	)
)

(define (fermat-test n)
	(define (try-it a)
		(= (expmod-r a n n) a)
	)
	(try-it (+ 1 (random (- n 1))))
)

(define (fast-prime? n times)
	(cond
		((= times 0) true)
		((fermat-test n) (fast-prime? n (- times 1)))
		(else false)
	)
)

(fast-prime? 91 10)
(fast-prime? 83 10)
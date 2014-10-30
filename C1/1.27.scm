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

(fast-prime? 561 100)
(smallest-divisor 561)
(fast-prime? 6601 100)
(smallest-divisor 6601)
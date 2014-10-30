(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (real-time-clock))
)

(define (start-prime-test n start-time)
	(cond
		((prime? n)
			(report-prime (- (real-time-clock) start-time))
			true
		)
		(else false)
	)
)

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time)
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

(define (search-for-primes n count)
	(cond 
		((= count 0) true)
		((timed-prime-test n)
			(search-for-primes (+ n 2) (- count 1)))
		(else
			(search-for-primes (+ n 2) count)
		)
	)
)

(search-for-primes 1001 3)
(search-for-primes 10001 3)
(search-for-primes 100001 3)
(search-for-primes 1000001 3)
(search-for-primes 10000001 3)
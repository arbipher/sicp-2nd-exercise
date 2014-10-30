(define (true-false-via-if x)
		(if x 
			1 
			0))

(true-false-via-if (= 1 1))

(true-false-via-if (= 1 2))


(define (true-false-via-cond x)
		(cond	(x 1) 
				(else 0)))

(true-false-via-cond (= 1 1))

(true-false-via-cond (= 1 2))
(define (power-close-to-iter base limit product exponent)
	(if (> (* base product) limit)
	    exponent
	    (power-close-to-iter base limit (* base product) (+ exponent 1))))

(define (power-close-to base limit)
	(power-close-to-iter base limit 1 1))

(power-close-to 2 1000)

;using (expt b e)

(define (power-close-to-iter base limit exponent)
	(if (> (expt base exponent) limit)
	    exponent
	    (power-close-to-iter base limit (+ exponent 1))))

(define (power-close-to base limit)
	(power-close-to-iter base limit 1))

(power-close-to 2 1000)
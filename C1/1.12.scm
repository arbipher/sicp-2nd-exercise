(define (pt i j)
	(cond
		((<= j 0) 1)
		((<= i j) 1)
		(else (+ (pt (- i 1) (- j 1)) (pt (- i 1) j)))
	)
)

(pt 2 1)
(pt 3 1)
(pt 4 1)
(pt 4 2)
(pt 4 3)
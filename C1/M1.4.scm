(define (sign x) 
		(cond 	((> x 0) +1)
				((< x 0) -1)
				(else 0)))

(sign 3)

(sign -2)

(sign 0)
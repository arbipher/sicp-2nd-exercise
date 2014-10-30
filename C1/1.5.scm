(define (p) (p))

(define (text x y)
	(if (= x 0)
		0
		y))

(test 0 (p))

;normal-order: fully expand and the reduce;
;expand operator

;applicative-order: evaluate the arguments and they apply
;expand operand
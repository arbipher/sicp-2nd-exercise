(define (fmax a b) 
	(if (> a b)
		a 
		b))

(define (fmin a b)
	(if (< a b)
		a
		b))

(define (fsquare a)
	(* a a))

(define (square-of-larger-two x y z)
	(+ 
		(fsquare (fmax x y)) 
		(fsquare (fmax (fmin x y) z))))

(square-of-larger-two 1 3 2)
(square-of-larger-two 3 2 1)
(square-of-larger-two 1 2 3)
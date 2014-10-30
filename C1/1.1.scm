10
;10

(define a 3)
;a

(define b (+ a 1))
;b

(+ a b (* a b))
;

(= a b)

(if (and (> b a) (< b (* a b)))
	b
	a)

(cond
	((= a 4) 6)
	((= b 4) (+ 6 7 a))
	(else 25))
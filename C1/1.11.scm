(define (f n)
	(if (< n 3) 
		n
		(+ (f (- n 1))
		    (* 2 (f (- n 2)))
			(* 3 (f (- n 3)))
		)
	)
)

(f 1)
;1

(f 2)
;2

(f 3)
;2 + 2 * 1 + 3 * 0 = 4

(f 4)
;4 + 2 * 2 + 3 * 1 = 11

(f 5)
;11 + 2 * 4 + 3 * 2 = 25

(define (v pv ppv pppv)
	(+ pv
		(* 2 ppv)
		(* 3 pppv)
	)
)

(define (fi pv ppv pppv i n)
	(if (>= i n)
		(v pv ppv pppv)
		(fi (v pv ppv pppv) pv ppv (+ i 1) n)
	)
)


(define (ff n)
	(if (< n 3)
		n
		(fi 2 1 0 3 n)
	)
)

(ff 1)

(ff 2)

(ff 3)

(ff 4)

(ff 5)
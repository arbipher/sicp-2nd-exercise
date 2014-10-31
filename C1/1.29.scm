(define (sum term a next b)
  (if (> a b)
  	0
  	(+ (term a)
  	   (sum term (next a) next b))
  )
)

(define (inc n)
  (+ n 1)
)

(define (id x)
  x)

;(sum id 1 inc 100)

(define (integral f a b dx)
  (define (add-dx x)
  	(+ x dx))
  (define half-dx (/ dx 2.0))
  (* (sum f (+ a half-dx) add-dx b)
  	  dx)
)

(define (constant x)
	1
)

(define (cube x)
  (* x x x))

;(integral constant 1 3 0.1)
;(integral square 1 3 0.1)

(define (sr-integral f a b n)
  (define h
    (/ (- b a) n))
  (define (next-x x)
    (+ x (* 2 h)))
  (/ (* h
  	(+
  		(f a)
  		(* 2 (sum f (+ a (* 2 h)) next-x (- b (* 2 h))))
  		(* 4 (sum f (+ a h) next-x (- b h)))
  		(f b)
  	))
  	3.0
  )
)

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(sr-integral cube 0 1 100)
(sr-integral cube 0 1 1000)
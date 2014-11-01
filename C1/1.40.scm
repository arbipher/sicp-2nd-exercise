(define tolerance 0.00001)
(define dx 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
  	(< (abs (- v1 v2)) tolerance)
  )
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
      	next
      	(try next)
      )
    )
  )
  (try first-guess)
)

(define (average-damp f)
  (lambda (x)
  	(/
  	  (+ x (f x))
  	  2.0
  	)
  )
)

(define (deriv g)
  (lambda (x)
  	(/
      (-
      	(g (+ x dx))
      	(g x)
      )
      dx
  	)
  )
)

(define (newton-transform g)
  (lambda (x)
  	(- 
  	  x
  	  (/
  	  	(g x)
  	  	((deriv g) x)
  	  )
  	)
  )
)

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
)

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess)
)


(define (sqrt-n x)
  (newtons-method
  	(lambda (y) (- (square y) x))
  	1.0
  )
)
;newtons-method of y^2-x
;fixed-point of newton-transform( y^2-x )
;fixed-point of y - (y^2-x)/2y

(define (sqrt-a x)
  (fixed-point-of-transform
  	(lambda (y) (/ x y))
  	average-damp
  	1.0
  )
)
;fixed-point of average-damp( x/y )
;fixed-point of 0.5*(y + x/y) 

(define (sqrt x)
  (fixed-point-of-transform
  	(lambda (y) (- (square y) x))
  	newton-transform
  	1.0
  )
)
;fixed-point of newton-transform( y^2-x )
;fixed-point of y - (y^2-x)/2y = 0.5*(y+x/y)
;the same as average-damp

;(sqrt-n 10)
;(sqrt-a 10)
;(sqrt 10)

(define (cubic a b c)
  (lambda (x)
  	(+
  	  (* x x x)
  	  (* a x x)
  	  (* b x)
  	  c
  	)
  )
)

(define (zeros-of-cubic a b c guess)
  (newtons-method
  	(cubic a b c)
  	guess
  )
)

(zeros-of-cubic 1 1 1 1)
;x(x-1)(x-2) = x^3 -3x^2 + 2x + 0
(zeros-of-cubic -3 2 0 -0.5)
(zeros-of-cubic -3 2 0 0.8)
(zeros-of-cubic -3 2 0 1.5)
(zeros-of-cubic -3 2 0 2.5)


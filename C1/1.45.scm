(define (composite f g)
  (lambda (x) (f (g x)))
)

(define (repeated f n)
  (if (= n 1)
  	f
  	(composite f (repeated f (- n 1)))
  )
)

(define tolerance 0.00001)

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

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess)
)

(define (average-damp f)
  (lambda (x)
  	(/
  	  (+ x (f x))
  	  2.0
  	)
  )
)


(define (sqrt x)
  (fixed-point-of-transform
  	(lambda (y) (/ x y))
  	average-damp
  	1.0
  )
)

(define (cube-r x)
  (fixed-point-of-transform
  	(lambda (y) (/ x (expt y 3)))
  	(repeated average-damp 1)
  	1.0
  )
)

(define (cube-root-any x n)
  (fixed-point-of-transform
  	(lambda (y) (/ x (expt y (- n 1))))
  	(repeated average-damp (floor (/ (log n) (log 2))))
  	1.0
  )
)

(cube-root-any (expt 2 32) 32)
(define (composite f g)
  (lambda (x) (f (g x)))
)

((composite square 1+) 3)

(define (repeated f n)
  (if (= n 1)
  	f
  	(composite f (repeated f (- n 1)))
  )
)

((repeated square 2) 5)
((repeated (repeated 1+ 10) 2) 0)

(define dx 0.01)

(define (smooth f)
  (lambda (x)
  	(/
      (+ 
      	(f (- x dx))
      	(f x)
      	(f (+ x dx))
      )
  	  3
  	)
  )
)

(define (n-fold-smooth f n)
  (lambda (x)
  	(((repeated smooth n) f) x)
  )
)
(square 10)
((smooth square) 10)
((n-fold-smooth square 2) 10)
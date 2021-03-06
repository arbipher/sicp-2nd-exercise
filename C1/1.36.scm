(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
  	(< (abs (- v1 v2)) tolerance)
  )
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
      	next
      	(try next)
      )
    )
  )
  (try first-guess)
)

(define (f-target x)
  (/ (log 1000) (log x))
)

(define (f-target-damping x)
  (/ (+ x (/ (log 1000) (log x))) 2.0)
)


(fixed-point f-target 3.0)
(fixed-point f-target-damping 3.0)
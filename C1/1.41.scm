(define (d f)
  (lambda (x)
  	(f (f x))
  )
)

;(((double double) inc) 5)
;((((double double) double) inc) 5)

(((d (d d)) 1+) 5)
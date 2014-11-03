;(define (d f)
;  (lambda (x)
;  	(f (f x))
;  )
;)

(define d
  (lambda (f)
    (lambda (x)
  	  (f (f x))
    )
  )
)

(define (t f)
  (lambda (x)
  	(f (f (f x)))
  )
)

(((t t) 1+) 0)
;(((double double) inc) 5)
;((((double double) double) inc) 5)

(((d (d d)) 1+) 5)

(((d (d d)) 1+) 0)
((d (d (d 1+))) 0)

(
  (
  	(
      (lambda (f) (lambda (x) (f (f x))))
        (lambda (f) (lambda (x) (f (f x))))
    )
    1+
  )
  0
)

(
  (
    (
      (lambda (f) (lambda (x) (f (f x))))
        (lambda (f) (lambda (x) (f (f x))))
    )
    1+
  )
  0
)

;((((d t) d) 1+) 0)
;((t (d (d 1+))) 0)
;((^2 ^3) ^2)
;512 = 2^9 = 2^(3^2)

;((((t d) d) 1+) 0)
;((^3 ^2) ^2)
;256 = 2^(2^3)

;(((t (d d)) 1+) 0)
;(^3 (^2 ^2))
;64 = (2^2)^3

;(((d (d t)) 1+) 0)
;(^2 (^2 ^3))
;81 = (3^2)^2

;(((d (t d)) 1+) 0)
;(^2 (^3 ^2))
;64 = (2^3)^2
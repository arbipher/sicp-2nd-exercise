(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

(f f)

;(f (lambda (x) (x 2)))

;((lambda (x) (x 2)) 2)

;(2 2)
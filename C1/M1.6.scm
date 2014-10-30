;ax^2+bx+c

(define (discriminant a b c)
  (- (* b b)
  	 (* 4 (* a c))))

(discriminant 1 -2 1)
(discriminant 2 3 4)

(define (real-part a b)
  (/ b (* -2 a)))

(real-part 1 -2)
(real-part 2 3)

(define (root-1 a b c)
	(+ (real-part a b) (/ (sqrt (discriminant a b c)) (* 2 a))))

(define (root-2 a b c)
	(- (real-part a b) (/ (sqrt (discriminant a b c)) (* 2 a))))

(root-1 1 -2 1)
(root-2 1 -2 1)
(root-1 2 3 4)
(root-2 2 3 4)

(define (smallest-real-part a b c)
  (if (>= (discriminant a b c) 0)
      (if (< (abs (root-1 a b c)) (abs (root-2 a b c)))
          (root-1 a b c)
          (root-2 a b c))
      (real-part a b)))

(smallest-real-part 1 -2 1)
(smallest-real-part 2 -6 4)
(smallest-real-part 2 3 4)
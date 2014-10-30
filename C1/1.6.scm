;Newtow's Method for Square Root
(define (sqrt-iter guess x)
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) .001))

(define (sqrt x)
	(sqrt-iter 1.0 x))


;count
(define (print x)
  (display x)
  (newline))

(define (count1 x)
  (cond ((= x 0) (print x))
  		(else	(print x)
  				(count1 (- x 1)))))
;3 2 1 0

(define (count2 x)
  (cond ((= x 0) (print x))
  		(else	(count2 (- x 1))
  				(print x))))
;0 1 2 3


(count1 3)
(count2 3)



;Ex 1.6
(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
		(else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (sqrt-iter-new guess x)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter-new (improve guess x) x)))

(define (sqrt-new x)
	(sqrt-iter-new 1 x))

(new-if #t (display "good") (display "bad"))

(trace sqrt)

(sqrt 3)

(trace sqrt-new)

(sqrt-new 3)

;note 15, page 18, SICP 2nd
;A minor difference between if and cond is that, in Scheme, 
;the <e> part of each cond clause may be a sequence of
;expressions. If the corresponding <p> is found to be true
;the expressions <e> are evaluated in sequence and the value 
;of the final expression in the sequence is returned as the
;value of the cond
;In an if combination, however, the <consequent> and 
;<alternative> must be single expressions.

;this exercise has few to do with cond-vs-if
;the key point is new-if wrapper cond in a function
;since scheme is applicative-order, each operands of a function
;will be evaluation first. Thus the recursive loop won't stop
;even the predicate of the cond becomes false

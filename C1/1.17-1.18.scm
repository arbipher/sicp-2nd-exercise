(define (times a b)
	(if (= b 0)
		0
		(+ a (times a (- b 1)))))

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(define (fast-times a b)
  (cond ((= b 1) a)
        ((even? b) (fast-times (double a) (halve b)))
    	(else (+ a (fast-times (double a) (halve (- b 1)))))))

(fast-times 30 21)

(define (fast-times-iter a b s)
	(cond ((= b 1) (+ a s))
	      ((even? b) (fast-times-iter (double a) (halve b) s))
	  	  (else (fast-times-iter (double a) (halve (- b 1)) (+ a s)))))

(fast-times-iter 30 21 0)
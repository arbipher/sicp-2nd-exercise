(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
    	((= y 1) 2)
    	(else (A (- x 1)
    			 (A x (- y 1))))))
(A 1 10)
;A 0 (A 1 9)
;2 * A 0 (A 1 8)
;2^8 * A 0 (A 0 1)
;2^8 * 2 * 2
;2^10
;1024

(A 2 4)
;A 1 (A 2 3)
;A 1 2^4
;2^(2^4)=2^16
;
;A 2 3
;A 1 (A 2 2)
;A 1 4
;2^4
;
;A 2 2
;A 1 (A 2 1)
;A 1 2
;A 0 (A 1 1)
;2 * 2
;2^2

(A 3 3)
;A 2 (A 3 2)
;A 2 4
;1024
;
;A 3 2
;A 2 (A 3 1)
;A 2 2
;4

(define (power-iter b e p)
  (if (= e 0)
      p
      (power-iter b (- e 1) (* p b))))

(define (power b e)
  (power-iter b e 1))

(define (f n)
  (A 0 n))

(define (g n)
  (A 1 n))

(define (h n)
  (A 2 n))

(define (k n)
  (* 5 n n))

(* 2 7)
(f 7)

(power 2 7)
(g 7)

(power 2 13)
(g 13)

(power 2 (power 2 2))
(h 3)

(power 2 (power 2 (power 2 2)))
(h 4)

;(power 2 (power 2 (power 2 (power 2 2))))
;(h 5)



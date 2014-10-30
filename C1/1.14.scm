(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ( (or (< amount 0) (= kinds-of-coins 0)) 0)
    (else (+ (cc (- amount (first-denomination kinds-of-coins))
           kinds-of-coins)      ;use one large coin
         (cc amount
           (- kinds-of-coins 1))))))  ;omit the large coin

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
      ((= kinds-of-coins 5) 50)))

(count-change 100)

(count-change 11)
;cc 11 5
;+ (cc -45 5) (cc 11 4)
;+ (cc 11 4)
;+ (cc -14 4) (cc 11 3)
;+ (cc 1 3) (cc 11 2)
;+ (cc -9 3) (cc 1 2) (cc 11 2)
;+ (cc -4 2) (cc 1 1) (cc 11 2)
;+ (cc 0 1) (cc 1 0) (cc 11 2)
;+ 1 (cc 11 2)
;+ 1 (cc 6 2) (cc 11 1)
;+ 1 (cc 1 2) (cc 6 1) (cc 11 1)
;+ 1 (cc -4 2) (cc 1 1) (cc 6 1) (cc 11 1)
;+ 1 (cc 0 1) (cc 1 0) (cc 6 1) (cc 11 1)
;+ 1 1 0 (cc 6 1) (cc 11 1)
;+ 2 (cc 5 1) (cc 6 0) (cc 11 1)
;+ 2 ... 1 1
;4

;time analysis
;t(cc n 1)
;t(cc n-1 1) + t(cc n 0)
;t(cc n-1 1) + 1
;=>
;t(cc n 1) ~ n
;
;t(cc n 2)
;t(cc n-2 2) + t(cc n 1)
;t(cc n-2 2) + n


(define (cc-iter amount kinds-of-coins count)
  (cond ((= amount 0) (+ 1 count))
        ((or (< amount 0) (= kinds-of-coins 0)) count)
        (else (cc-iter amount 
                 (- kinds-of-coins 1)
                 (+ count (cc-iter (- amount (first-denomination kinds-of-coins))
                                   kinds-of-coins 
                                 0))))))

(define (count-change-iter amount)
  (cc-iter amount 5 0))

;(trace cc-iter)

(count-change-iter 26)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (modulo a b))))

(gcd 206 40)
;applicative-order
;(gcd 40 6)
;(gcd 6 4)
;(gcd 4 2)
;(gcd 2 0)
;2
;count = 4
;
; answer from
; (gdc 206 40)
; (gdc 40 6): if b +1
; (gdc 6 4): if b +2
; (gdc 4 2): if b +4
; (gdc 2 0): if b +7, then +4
;
;reference http://www.moon-soft.com/doc/45201.htm
;; 为了简单起见，以n-re表示某个含有n个remainder操作的表达式
;; (gcd 206 40)                             ;; 即gcd(206,40)
;; ==> (if (= 40 0) 206 (gcd 40 1-re))
;; ==> (gcd 40 1-re)                        ;; 即gcd(40,6)
;; ==> (if (= 1-re 0) 40 (gcd 1-re 2-re))   ;; 条件判断evaluate 1-re  (+1)
;; ==> (gcd 1-re 2-re)                      ;; 即gcd(6,4)
;; ==> (if (= 2-re 0) 1-re (gcd 2-re 4-re)) ;; 条件判断evaluate 2-re  (+2)
;; ==> (gcd 2-re 4-re)                      ;; 即gcd(4,2)
;; ==> (if (= 4-re 0) 2-re (gcd 4-re 7-re)) ;; 条件判断evaluate 4-re  (+4)
;; ==> (gcd 4-re 7-re)                      ;; 即gcd(2,0)
;; ==> (if (= 7-re 0) 4-re (gcd 7-re 12-re));; 条件判断evaluate 7-re  (+7)
;; ==> 4-re                                   ;; 条件满足，取4-re
;; ==> 0-re                                   ;; 4次remainder操作，     (+4)
;;                                            ;; evaluation得最后结果
;;
;; 正则序下，共有remainder操作1+2+4+7+4=18次
;;
;;NN = 2^NA - 2 + NA = 2^4 - 2 + 4 = 18
; Sum square difference closed form
; = ( (x+1)*(x/2) )^2 - ( (x(x+1)(2x+1)) )/6
; = ( (x^2+x)/2 )^2 - ( (x(x+1)(2x+1)) )/6
; =   (x^2+x)^2 /4 - ( (x(x+1)(2x+1)) )/6
(defvar x 100)
(defun sumsquarediff (x)
  (- (/ (expt (+ (* x x) x) 2) 4) (/ (* x (1+ x) (1+ (* 2 x))) 6)))
(format t "~a~%" (sumsquarediff x))
; One liner
;(format t "~a~%" (- (/ (expt(+(* x x)x)2) 4) (/ (* x(1+ x)(1+ (* 2 x))) 6)))

; Number field sieve to find sum of primes below a number.

;(defvar maxnum 10) ; Should be 2+3+5+7=17
(defvar maxnum (* 2 (expt 10 6))) ; Should be 142913828922

(defvar arr (make-array (1+ maxnum) :initial-element 1))
(defvar res(loop for i from 2 to maxnum for p = (= 1 (elt arr i)) 
                  when p do
                  (loop for c = (+ i i) then (+ c i) until (> c maxnum) do
                        (setf (elt arr c) 0))
                  when p sum i))
(format t "~a~%" res)

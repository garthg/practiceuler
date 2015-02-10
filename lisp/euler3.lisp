; Prime factorization

; Input from Euler Project problem 3
(defvar input 600851475143)

; Function that builds list of prime factors
(defun factorize (input &optional (factors '()))
  (if (= 1 input) factors
    (loop for i from 2 to input do
          (when (= 0 (mod input i))
            (setq factors (if (null (assoc i factors))
                            (acons i 0 factors) factors))
            (rplacd (assoc i factors) (+ 1 (cdr (assoc i factors))))
            (return (factorize (/ input i) factors))))))

; Get prime factors and then the max key as result
(defvar factors (factorize input))
(defvar result 0)
(mapc (lambda (x) (setq result (max result (car x)))) factors)

; Print result
(print factors)
(print result)
(format t "~%")

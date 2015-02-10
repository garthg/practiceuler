; Largest palindrome that is the product of two three-digit numbers

(defvar digits 3)

(defun palindromize (input digits)
  (+ (* input (expt 10 digits))
     (loop for i from 0 to (1- digits) sum
           (* (mod (floor (/ input (expt 10 i))) 10)
              (expt 10 (- digits (1+ i)))))))

(defvar maxpal (floor (/ (expt (1- (expt 10 digits)) 2) (expt 10 digits))))

(defvar minfactor (expt 10 (1- digits)))
(defvar maxfactor (1- (expt 10 digits)))
(defvar palindrome)
(defvar quotient)
(defvar result (loop for i from 0 to maxpal do
                     (setq palindrome (palindromize (- maxpal i) digits))
                     (when (loop for j from minfactor to maxfactor 
                                 do (setq quotient (/ palindrome j))
                                 thereis
                                 (and
                                         (eq 0 (mod quotient 1))
                                         (>= quotient minfactor)
                                         (<= quotient maxfactor)))
                       (return palindrome))))
(print result)
  
(format t "~%")

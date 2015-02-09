; Sum of even fibonacci terms below four million
(defvar cutoff (* 4 (expt 10 6)))

(defun fibsum (valmax &optional (runsum 0) (prev1 1) (prev2 1))
  (let ((curr (+ prev1 prev2)))
    (if (> curr valmax) runsum
      (fibsum
        valmax 
        (if (= 0 (mod curr 2)) (+ runsum curr) runsum)
        curr prev1))))
(defvar res (fibsum cutoff))
(format t "~a~%" res)

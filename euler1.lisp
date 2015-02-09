; Sum of all multiples of three and five

(defvar cutoff 1000)
(defvar res
  (loop for i from 1 to (- cutoff 1) sum
        (if (or (= 0 (mod i 3)) (= 0 (mod i 5))) i 0)))
(format t "~a~%" res)

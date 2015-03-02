; Pythagorean triples.
;
; Integer solution for:
; 0 = a^2 + b^2 - c^2
; in terms of 'a' where
; b = (500000 - 1000a) / (1000-a)
; c = 1000 - b - a
(defun filter (a)
  (let ((b (/ (- 500000 (* 1000 a)) (- 1000 a))))
    (let ((c (- 1000 (+ a b))))
      (if (and (eq 0 (mod a 1))
               (eq 0 (mod b 1))
               (< a b)
               (eq (* c c) (+ (* b b) (* a a))))
        (list a b c)
        nil))))
(defvar matches (loop for i from 1 to 500 for f = (filter i) when f collect f))
(print matches)
(defvar res (apply '* (car matches)))
(format t "~%~a~%" res)

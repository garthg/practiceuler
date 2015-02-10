; Least common multiple
;
; My implementations are slower in lisp than in ruby.
; I think this is because it is not very efficient to use alists as the 
; key-value mapping for large numbers of keys, and that should be a hash-map 
; instead.

; Function to merge two alists
(defun mergealist(a b func default)
  (dolist (curr b)
    (let ((key (car curr)))
      (setq a (if (null (assoc key a)) (acons key default a) a))
      (rplacd (assoc key a) (funcall func (cdr (assoc key a)) (cdr curr)))))
  a)

; Function that builds list of prime factors
; Adapted from euler3.lisp.
(defun factorize (input &optional (factors nil))
  (if (= 1 input) factors
    (loop for i from 2 to input do
          (when (= 0 (mod input i))
            (setq factors (mergealist factors (acons i 1 nil) '+ 0))
            (return (factorize (/ input i) factors))))))

; Version with recursion
(defun leastcommonmultiple(numbers &optional (factor nil))
  (setq factor (mergealist factor (factorize (car numbers)) 'max 0))
  (if (eq 1 (length numbers))
    (reduce (lambda (x y) (* x (expt (car y) (cdr y)))) factor :initial-value 1)
    (leastcommonmultiple (cdr numbers) factor)))

; Version with looping
(defun leastcommonmultiple2(numbers)
  (let ((factor nil))
    (dolist
      (i numbers) (setq factor (mergealist factor (factorize i) 'max 0)))
    (reduce (lambda (x y) (* x (expt (car y) (cdr y))))
            factor :initial-value 1)))

; Run the functions
(defvar cutoff 20)
; Loop version (over a minute for 100k)
(print (leastcommonmultiple2 (loop for i from 2 to cutoff collect i)))
; Builtin version (7 seconds for 100k)
(print (apply 'lcm (loop for i from 2 to cutoff collect i)))
; Recursive version (over a minute for 100k)
(print (leastcommonmultiple (loop for i from 2 to cutoff collect i)))
(format t "~%")


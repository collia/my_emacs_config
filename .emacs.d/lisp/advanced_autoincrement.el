(defun difference-two-string (first-line secons-line)
 "Compare and return indexes of equal substrings"
 (let* ((first-difer-sym (abs (compare-strings first-line nil nil second-line nil nil)))
       (counter first-difer-sym))
   (if (not (eq first-difer-sym t))
       (progn
;	 (setq first-difer-sym (abs first-difer-sym))
;	 (message (substring first-line (- first-difer-sym 1) nil))
	 (while (not (eq (compare-strings first-line counter nil second-line counter nil) t))
	   (setq counter (1+ counter)))
	 (message (substring first-line counter )))
     (message "Strings are equal"))))


(defun parse-two-previous-lines ()
  "Function take two prev lines , compare them and find value to increment"
  (previous-line)
  (let ((second-line (thing-at-point 'line)))
    (previous-line)
    (let ((first-line (thing-at-point 'line)))
      (difference-two-string first-line second-line))))
	  

;(defun parse-two-previous-lines ()
;  "Function take two prev lines , compare them and find value to increment"
;  (previous-line)
;  (let ((second-line (thing-at-point 'line)))
;    (previous-line)
;    (let ((first-line (thing-at-point 'line)))
;      (let ((first-difer-sym (compare-strings first-line nil nil second-line nil nil)))
;	(if (equal first-difer-sym t)
;	    (progn  
;	     ;;(setq first-difer-sym (abs first-difer-sym))
;	      (message (number-to-string first-difer-sym))
;	      (message (substring first-line (- first-difer-sym 1) nil)))
;	  (message "Strings are equal"))))))


(defun advans-increment ()
  "Function analize two prev lines, compare then, find value to increment and write new line"
  (interactive)
  (parse-two-previous-lines))


(defun diference-lines (first-line second-line startcol endcol)
  "Copy first part, try to convert val to number, and form next line"
  (let* ((firstnum (string-to-int (substring first-line startcol endcol)))
	(secondnum (string-to-int (substring second-line startcol endcol)))
	(nextnum (+ secondnum (- secondnum firstnum))))
    (message "Numbers %d %d" firstnum secondnum)
    (message "%s%d%s" (substring first-line 0 startcol) nextnum (substring first-line endcol nil))))


(defun advansed-increment (start end)
  "Print number of lines and characters in the region."
  (interactive "r")
  (save-excursion
    (setq second-line (thing-at-point 'line))
    (previous-line)
    (setq first-line (thing-at-point 'line))
    (goto-char start)
    (setq startcol (current-column))
    (goto-char end)
    (setq endcol (current-column))
	(setq filtered-first-line 
		  (with-temp-buffer
		   (insert first-line)
		   (set-text-properties (point-min) (point-max) nil)
		   (buffer-string)))
	(setq filtered-second-line 
		  (with-temp-buffer
		   (insert second-line)
		   (set-text-properties (point-min) (point-max) nil)
		   (buffer-string)))
	(next-line)
    (insert (diference-lines filtered-first-line filtered-second-line startcol endcol)))
  (next-line))
;    (message "Region has %d lines, %d columns"
;	     (count-lines start end) (- endcol startcol))))



test 0 aa
test 1 aa







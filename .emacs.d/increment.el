
(defun compare-and-increment ()
  "Function compare two previous lines and found difference.
Than create next line with incremented value"
  (interactive)
  (previous-line)
  (let ((second-line (thing-at-point `line)))
    (previous-line)
    (let ((first-line (thing-at-point `line)))
;      (message first-line)
      (let ((difer (compare-strings first-line nil nil second-line nil nil)))
	(if (not (equal difer t))
	    (list 
;	     (message (int-to-string difer))
	     (if (< difer 0) (setq difer (- difer)))
	     (message (substring first-line (- difer 1) nil)))
	  (message "String are equal"))))))


(defun generate-next-line (first-line second-line start end)
  ""
  (let* ((first-part (substring first-line 0 start))
	(second-part (substring first-line end nil))
	(first-num (string-to-int (substring first-line start end)))
	(second-num (string-to-int (substring second-line start end)))
	(new-number (+ second-num (- second-num first-num))))
    (format "%s%d%s" first-part new-number second-part)))


(defun advansed-increment (start end)
  "Take two previous lines and generate next"
  (interactive "r")
  (save-excursion
    (setq current-position (point))
    (setq second-line (thing-at-point `line))
    (previous-line)
    (setq first-line (thing-at-point `line))
    (goto-char start)
    (setq startcol (current-column))
    (goto-char end)
    (setq endcol (current-column))
    (goto-char current-position)
    (end-of-line)
    (newline)
    (insert (generate-next-line first-line second-line startcol endcol)))
  (next-line)
  (move-to-column startcol)
  (set-mark (point))
  (move-to-column endcol))






































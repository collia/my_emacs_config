
(defun generate-next-line (first-line second-line start end basis)
  ""
  (setq num-basis 
	(cond
	 ((equal basis 'dec) 10)
	 ((equal basis 'hex) 16)
	 ((equal basis 'oct) 8)))
  (let* ((first-part (substring first-line 0 start))
	(second-part (substring first-line end nil))
	(first-num (string-to-number (substring first-line start end) num-basis))
	(second-num (string-to-number (substring second-line start end) num-basis))
	(new-number (+ second-num (- second-num first-num))))
    (cond
     ((equal basis 'dec)
      (format "%s%d%s" first-part new-number second-part))
     ((equal basis 'hex)
      (format "%s%X%s" first-part new-number second-part))
     ((equal basis 'oct)
      (format "%s%o%s" first-part new-number second-part)))))



(defun advansed-increment-internal (start end base)
  "Take two previous lines and generate next number base.
base can be 'dec 'hex 'oct"
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
    (insert (generate-next-line first-line second-line startcol endcol base)))
  (next-line)
  (move-to-column startcol)
  (set-mark (point))
  (move-to-column endcol))
  

(defun advansed-increment (start end)
  "Take two previous lines and generate next"
  (interactive "r")
  (advansed-increment-internal start end 'dec))


(defun advansed-increment-hex (start end)
  "Take two previous lines and generate next"
  (interactive "r")
  (advansed-increment-internal start end 'hex))

(defun advansed-increment-oct (start end)
  "Take two previous lines and generate next"
  (interactive "r")
  (advansed-increment-internal start end 'oct))

    











































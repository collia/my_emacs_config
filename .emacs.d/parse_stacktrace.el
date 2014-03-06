
(defun add-function-name-to-stacktrace (buffer)
  "Function take address from line and search it in 
map file, which contains in buffer.
    Parameter: 
     BUFFER - buffer with map"
  
  (let ((current-address (substring (current-word) 2))
	(oldbuf (current-buffer)))
    (set-buffer buffer)
    (revert-buffer t t t)
    (beginning-of-buffer)
    (if  (not (equal (search-forward current-address nil t) nil))
	(list (forward-char 4)
	      (let* ((functionname (current-word)))
		(set-buffer oldbuf)
		(end-of-line)
		(insert (concat " " functionname)))))
    (set-buffer oldbuf)
    (next-line)))

(defun parse-fail-stacktrace (buffer count)
  "function add function name for each line with count"
  (interactive "bMap file buffer: \nn Number of lines: ")
  (let ((x 0))
   (while (< x count)
     (add-function-name-to-stacktrace buffer)
     (setq x (+ x 1)))))



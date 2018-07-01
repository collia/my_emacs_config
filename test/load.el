;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.



(defun load-or-update-git-module (projects-directory module repository is-update)
  "Check if emacs module directory exist, and in case it doesnt, load module from git repository
in case directory exists, only update content on latest "
  (interactive "sModule: \nsRepository:")
  (let* ((module-directory (concat projects-directory module))
		 (modules (directory-files projects-directory)))
	(if (member module modules)
		(progn
		  (message (concat module " is present"))
		  (if is-update
			  (shell-command (concat "cd " module-directory "; git fetch "))
			0))
	  (progn
		(message (concat module " is not present"))
		(shell-command (concat "git clone " repository " " module-directory))))))

(defun load-module (module repository init-fnc &optional is-update)
  ""
  (let* ((projects-directory "~/my_emacs_config/test/")
		 (module-directory (concat projects-directory module))
		 (result (load-or-update-git-module projects-directory module repository is-update)))
	(if (eq result 0)
		(progn
		  (add-to-list 'load-path module-directory)
		  (funcall init-fnc))
	  (message result))))

(defvar modules-list ())

(add-to-list 'modules-list `("helm" "https://github.com/emacs-helm/helm.git" (lambda ()
															   (message "Loaded helm"))))


(defun update-modules (modules)
  (dolist (m modules)
	(load-module (car m) (cadr m) (caddr m) t)))

(defun load-modules (modules)
  (dolist (m modules)
		  (load-module (car m) (cadr m) (caddr m) nil)))


(load-modules modules-list)

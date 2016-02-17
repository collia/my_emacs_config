

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Global configurations

(add-to-list 'load-path "~/.emacs.d/lisp/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set up the Common Lisp environment
;;(add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
(add-to-list 'load-path "~/.emacs.d/slime/")
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
;;(slime-setup)
(slime-setup '(slime-fancy slime-asdf slime-tramp))


;; Text and the such
;; Use colors to highlight commands, etc.
(global-font-lock-mode t)
;; Disable the welcome message
(setq inhibit-startup-message t)
;; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")
;; Display time
(display-time)
;; Make the mouse wheel scroll Emacs
(mouse-wheel-mode t)
;; Always end a file with a newline
(setq require-final-newline t)
;; Stop emacs from arbitrarily adding lines to the end of a file when the
;; cursor is moved past the end of it:
(setq next-line-add-newlines nil)
;; Flash instead of that annoying bell
(setq visible-bell t)
;; Remove icons toolbar
(if (> emacs-major-version 20)
(tool-bar-mode -1))
;; Use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)
;; Scrolling with 1 line step
(setq scroll-step 1)
;; Highlight current line
(global-hl-line-mode 1)
;; 
(iswitchb-mode 1)
;; show column number
(column-number-mode t)

(fset 'yes-or-no-p 'y-or-n-p)
        (define-key query-replace-map [return] 'act)
        (define-key query-replace-map [?\C-m] 'act)

(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)

;Disable git 
(remove-hook 'find-file-hooks 'vc-find-file-hook)
(setq vc-handled-backends ())

(setq scroll-error-top-bottom t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Autocomplite
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Color theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-gnome2)
;(color-theme-wheat)
;(color-theme-taming-mr-arneson)
;(color-theme-word-perfect)
(color-theme-aalto-light)

;;(set-background-color "#333333")
;;(set-foreground-color "#ffffff")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font settings
;; Options -> Set default font

(if (null (x-list-fonts "monofur-12"))
    (if (null (x-list-fonts "Monoid-12"))
	(message "No good fonts on system")
      (progn
	(add-to-list 'default-frame-alist '(font . "Monoid-12"))
	(set-default-font "Monoid-12")))
  (progn
    (add-to-list 'default-frame-alist '(font . "monofur-12"))
    (set-default-font "monofur-12")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Autoload
(desktop-save-mode 1) 
;(desktop-load-default)
;(desktop-read)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;aspell
;;(add-to-list 'exec-path "C:/Program Files/Aspell/bin/")
(setq ispell-program-name "aspell")
;;(setq ispell-personal-dictionary "C:/path/to/your/.ispell")
(require 'ispell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;haskell-mode
(add-to-list 'load-path "~/.emacs.d/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/haskell-mode/")
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; line numbers
(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; perfect file open menu
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; show opened files
(require 'bs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Project manager
(load-file "~/.emacs.d/eproject-0.4/eproject.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Multiple cursors
(add-to-list 'load-path "~/.emacs.d/multiple-cursors")
(require 'multiple-cursors)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helm

(add-to-list 'load-path "~/.emacs.d/async")
(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;(when (executable-find "curl")
;  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; go-mode
;;
(add-to-list 'load-path "~/.emacs.d/lisp/go-mode")
(require 'go-mode-autoloads)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bindind filetypes
;;
(setq auto-mode-alist
            (append
             '(;; File name has no dot.
               ("/[^\\./]*\\'" . fundamental-mode)
               ;; File name ends in .hs
               ("\\.hs\\'" . haskell-mode)
	       ;; emacs config file
               (".emacs" . emacs-lisp-mode)
               ("\\.el\\'" . emacs-lisp-mode)
               ("\\.\\(frm\\|bas\\|cls\\|ebs\\)$" . visual-basic-mode)
               ("Makefile" . makefile-mode)
               ;; File name (within directory) starts with a dot.
               ("/\\.[^/]*\\'" . fundamental-mode))
             auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Enconding
(if (eq system-type 'windows-nt)
  (set-language-environment 'UTF-8) 
  (setq default-input-method 'russian-computer) 
  (set-selection-coding-system 'windows-1251) 
  (set-default-coding-systems 'windows-1251) 
  (prefer-coding-system 'windows-1251))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Server
(server-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; litable - pretty show of lisp code
(add-to-list 'load-path "~/.emacs.d/dash")
(require 'litable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hightlighting text in all buffer
(require 'highlight-symbol)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;key-maps

(global-set-key [?\C-c ?d] 'duplicate-line)

(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-<f8>") 'flyspell-mode)


(global-set-key [?\C-c ?s] 'save-a-copy-as)

(global-set-key [?\C-c ?l] 'goto-line)
(global-set-key [?\C-c ?S] 'desktop-save)

(global-set-key (kbd "C-c <f2>") 'call-last-kbd-macro)

;(global-set-key [f3] 'open-slime-setup)
;(global-set-key [M-f3] 'close-slime-setup)

(global-set-key [f7] 'compile)
(global-set-key [f11] 'gdb)


(global-set-key (kbd "C-c o") 'occur)

(global-set-key (kbd "<f2>") 'bs-show)
(global-set-key (kbd "C-<f2>") 'bs-kill)

(global-set-key (kbd "C-x r <down>") 'advansed-increment)
(global-set-key (kbd "C-x r C-<down>") 'advansed-increment-hex)

(global-set-key (kbd "C-x r M-i") 'fill-rectangle-by-increments-numbers)
(global-set-key (kbd "C-x r M-x") 'fill-rectangle-by-increments-numbers-hex)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(global-set-key [(control f6)] 'highlight-symbol-at-point)
(global-set-key [f6] 'highlight-symbol-next)
(global-set-key [(shift f6)] 'highlight-symbol-prev)
(global-set-key [(meta f6)] 'highlight-symbol-query-replace)

(global-set-key (kbd "C-.") 'find-tag-other-window)

(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-unset-key (kbd "C-x C-F"))
(global-set-key (kbd "C-x C-F") 'helm-find-files)
(global-unset-key (kbd "C-S"))
(global-set-key (kbd "C-S") 'helm-occur)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code style configurations

(setq c-default-style '((c-mode . "bsd")
			(c++-mode . "bsd")
			(awk-mode . "awk")
			(other . "free-group-style")))

;(slime)

(setq-default indent-spase-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
;(defvaralias 'c-basic-offset 'tab-width) 
(setq-default indent-tabs-mode nil)
;(setq-default indent-tabs-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;functions

(defun duplicate-line(number)
  "Function copies current line and pastyes it"
  (interactive "p")
  (let* ((copy-buffer (x-get-clipboard)))
    (dotimes (i number)
      (move-beginning-of-line 1)
      (kill-line)
      (yank)
      (open-line 1)
      (next-line 1)
      (yank))
    (kill-new copy-buffer)))


(defun save-a-copy-as (file-or-directory)
  "Saves a copy of the current buffer in the given directory or file, leaving
   the original file in the buffer, and asking for confirmation before
   overwriting an existing file."
  (interactive "FSave a copy as file: ")
  (save-excursion
    (save-a-copy-as-confirming file-or-directory t)))

(defun save-a-copy-as-confirming (target-file-or-directory confirming)
  "Saves a copy of the current buffer in the given target directory or file,
   leaving the original file in the buffer.

   If argument confirming is nil, will overwrite any existing file with the same
   name; if confirming is anything else, will prompt the user first."
  (let ((target-file
         (concat target-file-or-directory
                 (when (string-match "/$" target-file-or-directory)
                   (buffer-name)))))
    (write-region nil nil target-file nil nil nil confirming)))


(defun open-slime-setup ()
  "Open slime and configure current buffer positions"
  (interactive)
  (delete-other-windows)
  (let ((width  (car (cddr  (window-edges))))
	(height (car (cdddr (window-edges)))))
 ;   (message "%i" (/ width 2))
   (setq w  (selected-window))
;  (window-edges)
    (setq w2 (split-window w (* 3 (/ height 4))))
;  (window-edges w2)
    (setq w3 (split-window w (/ width 2) t))
     (slime)
    (select-window (next-window))
    (select-window (next-window))
    (switch-to-buffer "*slime-events*")))
;(window-edges)
;(car (cddr  (window-edges)))
;(car (cdddr (window-edges)))
;(message "%i" 123)
;(switch-to-buffer "*scratch*")
;(select-window (next-window))


(defun close-slime-setup () 
  "Closing all slime frames"
  (interactive)

 ; (slime-close-channel (slime-generate-connection-name))
  (kill-buffer "*slime-events*")
  (kill-buffer "*slime-repl sbcl*")
  (kill-buffer "*inferior-lisp*")
  (delete-other-windows))


(defun delete-duplicate-lines (beg end)
  (interactive "r")
  (let ((lines (split-string (buffer-substring beg end) "\n")))
        (delete-region beg end)
        (insert
         (mapconcat #'identity (delete-dups lines) "\n")))) 


(defun create-tags (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command 
      (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name))
     (visit-tags-table (concat dir-name "\TAGS")))
(defun revert-all-buffers ()
  "Go on all buffers with text ant try to revert it"
  (interactive)
  (save-excursion
    (let* ((curr-bf (current-buffer)))
      (dolist (buffer (buffer-list))
        (if (buffer-file-name buffer)
            (progn
              (switch-to-buffer buffer)
              (revert-buffer t t t))))
      (switch-to-buffer curr-bf))))

(defun insert-tab ()
  "Insert in current plase tab symbol"
  (interactive)
  (setq-default indent-tabs-mode t)
  (insert "\t")
  (setq-default indent-tabs-mode nil))
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load files with my plugins
(load "~/.emacs.d/lisp/parse_stacktrace.el")
(load "~/.emacs.d/lisp/increment.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ECB config

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(haskell-mode-hook (quote (turn-on-haskell-simple-indent))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

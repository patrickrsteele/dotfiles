;; Set up autoloading for all files in ~/.emacs.d/lisp. To update, run
;; update-autoloads-in-package-area.
;(load "~/.emacs.d/lisp/loaddefs.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; General configuration
;;

;; Define <RET> to behave like C-j
(defun RET-behaves-as-LFD ()
  (let ((x (key-binding "\C-j")))
    (local-set-key "\C-m" x)))

;; Use Adobe Source Sans Pro as the default font
;(set-face-attribute 'default nil :font "Source Code Pro")
;(set-face-attribute 'default nil :font "Droid Sans Mono-10")

;; Highlight selections
(transient-mark-mode 't)

;; Auto-indent new lines
(setq indent-line-function `indent-relative-maybe)

;; Make Emacs automatically match parenthesis, etc
(show-paren-mode 't)

;; Let C-<tab> insert a tab character
(global-set-key [C-tab] (lambda () (interactive) (insert-char 9 1)))

;; Turn on column numbering
(column-number-mode 't)

;; Stop C-z from backgrounding emacs
(global-set-key "\C-z" '(lambda () (interactive) (ansi-term "/bin/bash")))

;; Enable upcase-region command
(put 'upcase-region 'disabled nil)

;; Hide the top toolbar
(tool-bar-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LaTeX and AuxTeX Mode
;;

; Turn on auto-fill-mode, flyspell-mode
(mapc (lambda (hook) (progn (add-hook hook 'auto-fill-mode)
			    (add-hook hook 'flyspell-mode)))
      '(LaTeX-mode-hook tex-mode-hook plain-TeX-mode-hook 
			AmS-TeX-mode-hook ConTeXt-mode-hook 
			Texinfo-mode-hook docTeX-mode-hook))

; Disable font-locking for sub- and super-scripts in the various
; AuxTeX modes
(setq font-latex-fontify-script nil)
(setq font-latex-fontify-sectioning 'color)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; elisp
;;

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Python
;;

(add-hook 'python-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

;; Cython mode
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))

(define-derived-mode cython-mode python-mode "Cython"
  (font-lock-add-keywords
   nil
   `((,(concat "\\<\\(NULL"
               "\\|c\\(def\\|har\\|typedef\\)"
               "\\|e\\(num\\|xtern\\)"
               "\\|float"
               "\\|in\\(clude\\|t\\)"
               "\\|object\\|public\\|struct\\|type\\|union\\|void"
               "\\)\\>")
      1 font-lock-keyword-face t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Haskell
;;

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'font-lock-mode)

; Recognize *.hs-boot files as Haskell files
(add-to-list 'auto-mode-alist '("\\.hs-boot\\'" . haskell-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Octave
;;

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))

(add-hook 'octave-mode-hook 'RET-behaves-as-LFD)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; C, C++
;;

(add-hook 'c-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'c++-mode-hook 
	  '(lambda ()
	     (local-set-key (kbd "RET") 'newline-and-indent)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Helm
;;
(add-to-list 'load-path "~/lib/helm")
(require 'helm-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GO
;;
(add-to-list 'load-path "~/local/go/misc/emacs")
(require 'go-mode-load)
(add-hook 'go-mode-hook
	  '(lambda ()
	     (setq default-tab-width 2)))
(add-hook 'before-save-hook #'gofmt-before-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Miscellaneous fixes
;;

;; fix for Ubuntu 10.10 problem
;(setq flyspell-issue-welcome-flag nil)

;; Remove the toolbar; has to be done down here, rather than at the
;; top for some reason.
(tool-bar-mode -1)
(set-scroll-bar-mode 'nil)

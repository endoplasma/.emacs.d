;;############# general settings for emacs ##############
;; disabel startup screen
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

;; Font settings
(set-face-attribute 'default nil :family "Anonymous Pro" :height 100)

(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)

(global-hl-line-mode t)

;; turn of toolbar
(tool-bar-mode -1)

;; color settings
(load-theme 'zenburn t )

;; Set user
(setq user-full-name "Philipp Spliethoff")
(setq user-mail-address "philipp.spliethoff@tu-dortmund.de")

;; Backup
;;;; backup settings
(defvar autosave-dir "~/.emacs.d/backups/")
(make-directory autosave-dir t)
(setq backup-by-copying t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))
(setq delete-old-versions t) ; Delete Old version of backup files.
(setq kept-new-versions 2)
(setq kept-old-versions 2)
(setq make-backup-files t)

(setq LaTeX-csquotes-close-quote "}")
(setq LaTeX-csquotes-open-quote "\\enquote{")

(require 'uniquify)
(setq uniquify-buffer-name-style (quote post-forward))

(show-paren-mode 1)
(setq show-paren-delay 0)


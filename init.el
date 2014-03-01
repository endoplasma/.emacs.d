;;; package --- Basic Configuration for Emacs
;;; Commentary:
;;; Code:
;; initialise el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq my-el-get-packages
      (append 
       '(auctex
	 switch-window
	 auto-complete
	 color-theme-zenburn
	 smartparens
	 org-mode
	 vhdl-mode
	 yasnippet
	 projectile
	 helm
	 flycheck
	 magit
	 )))

;; install new packages and init already installed packages
(el-get 'sync my-el-get-packages)

;; Load Path for extensions
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/misc.el")


;;(load "~/.emacs.d/custom.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("471877df61bcd989ba4c0a5097654684fcfe918e124d46f811b533e44df34f53" default)))
 '(ecb-options-version "2.40")
 
 
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

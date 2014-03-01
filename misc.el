;; this file is for new and miscelanious configurations

;; ########## Octave ###############################################
;; Code from gnu.org
;; start octave-mode when entering a .m file
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
;; use autofill and abbrev mode in octave-mode
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))
;; this file is for new and miscelanious configurations

;; ########## Octave ###############################################
;; Code from gnu.org
;; start octave-mode when entering a .m file
;;(autoload 'octave-mode "octave-mod" nil t)
;;(setq auto-mode-alist
;;      (cons '("\\.m$" . octave-mode) auto-mode-alist))
;; use autofill and abbrev mode in octave-mode
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))

;; dont load octave mode for m files use the matlab-eamcs package and
;; fire up a matlab shell

(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))

;; ##################### autoload hooks ####################
;; my-set-monospaced-font is defined in 
(add-hook 'c-mode-common-hook
       (lambda() (my-set-monospaced-font)))


;; ##################### coding styles ######################



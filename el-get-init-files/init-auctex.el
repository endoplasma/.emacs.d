;; ########## AUCTEX ##################################################
(setq TeX-auto-save t)
; parse the document to enable e.g. document specific environment insertion etc.
(setq TeX-parse-self t)
; ask for the master document
(setq-default TeX-master nil)

;; flyspell in auctex

(add-hook `latex-mode-hook `(flyspell-mode t))
(add-hook `latex-mode-hook `(flyspell-buffer t))
(add-hook `tex-mode-hook `(flyspell-mode t))
(add-hook `tex-mode-hook `(flyspell-buffer t))
(add-hook `bibtex-mode-hook `(flyspell-mode t))
(add-hook `bibtex-mode-hook `(flyspell-buffer t))
(setq TeX-PDF-mode t)

;; #### Outline mode - to hide sections etc. ####
;; # C-c C-o C-l      - hide current section
;; # C-c C-o C-n     - next section
;; # C-c C-o C-p     - previous section
;; # C-c C-o C-a     - show all sections
;; ##############################
(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(require 'outline)
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c\C-o") ; Or something else
(define-key outline-mode-prefix-map (kbd "C-t") 'outline-toggle-children)

;; Reftex einflechten und laden
(setq reftex-plug-into-AUCTeX t)
(add-hook 'latex-mode-hook 'turn-on-reftex)

(setq LaTeX-csquotes-close-quote "}")
(setq LaTeX-csquotes-open-quote "\\enquote{")

(add-to-list 'auto-mode-alist '("\\.tikz\\'" . LaTeX-mode))

; Turn on RefTeX for AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
(setq reftex-plug-into-AUCTeX t)

;; add makeglossaries to commadn options
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
       '("Makeglossaries" "makeglossaries %s" TeX-run-command nil
         (latex-mode)
         :help "Run makeglossaries script, which will choose xindy or makeindex") t))

(provide 'init-auctex.el)

;;; init-auctex.el ends here

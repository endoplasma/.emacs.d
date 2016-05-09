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
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o") ; Or something else

;; Reftex einflechten und laden
(setq reftex-plug-into-AUCTeX t)
(add-hook 'latex-mode-hook 'turn-on-reftex)

(setq LaTeX-csquotes-close-quote "}")
(setq LaTeX-csquotes-open-quote "\\enquote{")

;(TeX-global-PDF-mode t)

; SyncTeX basics

; un-urlify and urlify-escape-only should be improved to handle all special characters, not only spaces.
; The fix for spaces is based on the first comment on http://emacswiki.org/emacs/AUCTeX#toc20

(defun un-urlify (fname-or-url)
  "Transform file:///absolute/path from Gnome into /absolute/path with very limited support for special characters"
  (if (string= (substring fname-or-url 0 8) "file:///")
      (url-unhex-string (substring fname-or-url 7))
    fname-or-url))

(defun urlify-escape-only (path)
  "Handle special characters for urlify"
  (replace-regexp-in-string " " "%20" path))

(defun urlify (absolute-path)
  "Transform /absolute/path to file:///absolute/path for Gnome with very limited support for special characters"
  (if (string= (substring absolute-path 0 1) "/")
      (concat "file://" (urlify-escape-only absolute-path))
      absolute-path))


; SyncTeX backward search - based on http://emacswiki.org/emacs/AUCTeX#toc20, reproduced on http://tex.stackexchange.com/a/49840/21017

(defun th-evince-sync (file linecol &rest ignored)
  (let* ((fname (un-urlify file))
         (buf (find-file fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: Could not open %s" fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col)))))

(defvar *dbus-evince-signal* nil)

(defun enable-evince-sync ()
  (require 'dbus)
  ; cl is required for setf, taken from: http://lists.gnu.org/archive/html/emacs-orgmode/2009-11/msg01049.html
  (require 'cl)
  (when (and
         (eq window-system 'x)
         (fboundp 'dbus-register-signal))
    (unless *dbus-evince-signal*
      (setf *dbus-evince-signal*
            (dbus-register-signal
             :session nil "/org/gnome/evince/Window/0"
             "org.gnome.evince.Window" "SyncSource"
             'th-evince-sync)))))

(add-hook 'LaTeX-mode-hook 'enable-evince-sync)


; SyncTeX forward search - based on http://tex.stackexchange.com/a/46157

;; universal time, need by evince
(defun utime ()
  (let ((high (nth 0 (current-time)))
        (low (nth 1 (current-time))))
   (+ (* high (lsh 1 16) ) low)))

;; Forward search.
;; Adapted from http://dud.inf.tu-dresden.de/~ben/evince_synctex.tar.gz
(defun auctex-evince-forward-sync (pdffile texfile line)
  (let ((dbus-name
     (dbus-call-method :session
               "org.gnome.evince.Daemon"  ; service
               "/org/gnome/evince/Daemon" ; path
               "org.gnome.evince.Daemon"  ; interface
               "FindDocument"
               (urlify pdffile)
               t     ; Open a new window if the file is not opened.
               )))
    (dbus-call-method :session
          dbus-name
          "/org/gnome/evince/Window/0"
          "org.gnome.evince.Window"
          "SyncView"
          (urlify-escape-only texfile)
          (list :struct :int32 line :int32 1)
  (utime))))

(defun auctex-evince-view ()
  (let ((pdf (file-truename (concat default-directory
                    (TeX-master-file (TeX-output-extension)))))
    (tex (buffer-file-name))
    (line (line-number-at-pos)))
    (auctex-evince-forward-sync pdf tex line)))

;; New view entry: Evince via D-bus.
(setq TeX-view-program-list '())
(add-to-list 'TeX-view-program-list
         '("EvinceDbus" auctex-evince-view))

;; Prepend Evince via D-bus to program selection list
;; overriding other settings for PDF viewing.
(setq TeX-view-program-selection '())
(add-to-list 'TeX-view-program-selection
         '(output-pdf "EvinceDbus"))

;; add makeglossaries to commadn options
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
       '("Makeglossaries" "makeglossaries %s" TeX-run-command nil
         (latex-mode)
         :help "Run makeglossaries script, which will choose xindy or makeindex") t))

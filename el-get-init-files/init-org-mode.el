;; ########## BEGIN ORG-MODE ########################################
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")


; automatically load orgmode wehen opening a dot org file
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
 (define-key mode-specific-map [?a] 'org-agenda)
 (eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)
      (define-key org-mode-map "\C-px" 'org-todo-state-map)
      (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))
     ))

;; ############ set some variables ##########

(setq org-agenda-custom-commands (quote (
					 ("d" todo "DELEGATED" nil) 
					 ("c" todo "DONE|DEFERRED|CANCELLED" nil)
					 ("w" todo "WAITING" nil)
					 ("W" agenda "" ((org-agenda-ndays 21)))
					 ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) 
							 (org-agenda-ndays 1) 
							 (org-agenda-overriding-header "Today's Priority #A tasks: "))) 
					 ("u" alltodo "" ( (org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "]+>"))) 
							  (org-agenda-overriding-header "Unscheduled TODO entries: ")))))
      )

(setq org-agenda-files (quote ("~/org/todo.org")))
(setq org-agenda-ndays 7)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)

(setq org-deadline-warning-days 14)
(setq org-default-notes-file "~/org/notes.org")
(setq org-fast-tag-selection-single-key (quote expert))
(setq org-reverse-note-order t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
	 "* TODO %? %^g\n  %U ")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")
	("n" "Note" entry (file+headline "~/org/notes.org" "Notizen")
	 "* %?\n  %x")
	)
      )


;; (setq org-remember-store-without-prompt t)
;;(setq org-remember-templates (quote ((116 "* TODO %?  %u" "~/org/todo.org" "Tasks") (110 "* %u %?" "~/org/notes.org" "Notizen") (113 "* %u %? %^g" "~/org/notes.org" "Fragen"))))

(setq org-default-notes-file (concat org-directory "/notes.org"))
     (define-key global-map "\C-cc" 'org-capture)

;; END of org mode

;; ########## MobileOrg ###############################################
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/todo.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; Enable encryption
(setq org-mobile-use-encryption t)
;; Set a password
(setq org-mobile-encryption-password "SicheresPasswort!2§")

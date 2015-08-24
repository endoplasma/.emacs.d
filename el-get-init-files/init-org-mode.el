;; ########## BEGIN ORG-MODE ########################################
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")

; automatically load orgmode wehen opening a dot org file
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

(setq org-agenda-files (list
			(quote "~/GTD/gtd.org") 
;;			(quote "~/org/todo.org") 
;;			(quote "~/org/postbote.org")
;;			(quote "~/org/import.org")
			))

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
 	("p" "Projektgruppe" entry (file+headline "~/org/postbote.org" "AP3")
	 "* TODO %? %^g\n  %U ")
	)
      )


;; (setq org-remember-store-without-prompt t)
;;(setq org-remember-templates (quote ((116 "* TODO %?  %u" "~/org/todo.org" "Tasks") (110 "* %u %?" "~/org/notes.org" "Notizen") (113 "* %u %? %^g" "~/org/notes.org" "Fragen"))))

(setq org-default-notes-file (concat org-directory "/notes.org"))
     (define-key global-map "\C-cc" 'org-capture)

;; END of org mode

;; ########## MobileOrg ###############################################
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/import.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; Enable encryption
 (setq org-mobile-use-encryption nil)
;; Set a password
;; (setq org-mobile-encryption-password "SicheresPasswort!2§")

;; ########## Beamer Themes ########################################
;; # Define a basic theme org-mode usese to export beamer presentations

;; allow for export=>beamer by placing

;; #+LaTeX_CLASS: beamer in org files
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
  ;; beamer class, for presentations
'("beamer"
     "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
                 frame=single,
                 basicstyle=\\small,
                 showspaces=false,showstringspaces=false,
                 showtabs=false,
                 keywordstyle=\\color{blue}\\bfseries,
                 commentstyle=\\color{red},
                 }\n
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n          
      \\subject{{{{beamersubject}}}}\n"
     
     ("\\section{%s}" . "\\section*{%s}")
	       
     ("\\begin{frame}[fragile]\\frametitle{%s}"
      "\\end{frame}"
      "\\begin{frame}[fragile]\\frametitle{%s}"
      "\\end{frame}")))



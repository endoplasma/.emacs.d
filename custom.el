(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-csquotes-close-quote "}")
 '(LaTeX-csquotes-open-quote "\\enquote{")
 '(custom-safe-themes (quote ("471877df61bcd989ba4c0a5097654684fcfe918e124d46f811b533e44df34f53" default)))
 '(ecb-options-version "2.40")
 '(org-agenda-custom-commands (quote (("d" todo "DELEGATED" nil) ("c" todo "DONE|DEFERRED|CANCELLED" nil) ("w" todo "WAITING" nil) ("W" agenda "" ((org-agenda-ndays 21))) ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/org/todo.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/org/notes.org")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-remember-store-without-prompt t)
 '(org-remember-templates (quote ((116 "* TODO %?  %u" "~/org/todo.org" "Tasks") (110 "* %u %?" "~/org/notes.org" "Notizen") (113 "* %u %? %^g" "~/org/notes.org" "Fragen"))))
 '(org-reverse-note-order t)
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler)))
 '(safe-local-variable-values (quote ((TeX-master . t) (eval ispell-change-dictionary "en_GB") (eval ispell-change-dictionary en_GB) (eval flyspell-buffer))))
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 )


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


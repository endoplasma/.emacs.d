;;; settings.el --- basic setting for the emacs system

;; Filename: settings.el
;; Description: basic setting for the emacs system
;; Author: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Created: 2014-03-02 13:52:34
;; Version: 0.1
;; Last-Updated: 2014-03-02 13:52:34
;;           By: Philipp Spliethoff
;; URL: https://github.com/endoplasma/.emacs.d/settings.el
;; Keywords: emacs
;; Compatibility: GNU Emacs 24.3.1
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;; 
;; basic seting for the Emacs system
;; 

;;; Code:

;; disabel startup screen
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

;; Font settings
(set-face-attribute 'default nil :family "Anonymous Pro" :height 130)
;;(set-face-attribute 'default nil :family "Anonymous Pro" :height 100)
;;(set-face-attribute 'default nil :family "Inconsolata" :height 110)
;;(set-default-font "Inconsolata-11")

(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)
(global-hl-line-mode t)

;; standard fill
(set-fill-column 80)

;; turn of toolbar
(tool-bar-mode -1)

;; color settings
(load-theme 'zenburn t )

;; Set user
(setq user-full-name "Philipp Spliethoff")
(setq user-mail-address "philipp.spliethoff@tu-dortmund.de")

;; Email settings for use with mutt
;; Yes, you can do this same trick with the cool "It's All Text" firefox add-on :-)
(add-to-list 'auto-mode-alist '("/mutt-\\|itsalltext.*mail\\.google" . mail-mode))
(add-hook 'mail-mode-hook 'turn-on-auto-fill)
(add-hook
 'mail-mode-hook
 (lambda ()
   (define-key mail-mode-map [(control c) (control c)]
     (lambda ()
       (interactive)
       (save-buffer)
       (server-edit)))))


;; Backup
; backup settings
(defvar autosave-dir "~/.emacs.d/backups/")
(make-directory autosave-dir t)
(setq backup-by-copying t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))
(setq delete-old-versions t) ; Delete Old version of backup files.
(setq kept-new-versions 2)
(setq kept-old-versions 2)
(setq make-backup-files t)


(require 'uniquify)
(setq uniquify-buffer-name-style (quote post-forward))

(show-paren-mode 1)
(setq show-paren-delay 0)

(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))


;; Font lock modes for Latex output to highlight warnings
(font-lock-add-keywords 'TeX-output-mode
  '(("^.*[wW]arning.*$" . font-lock-warning-face)
    ("^.*[mM]essage.*$" . font-lock-keyword-face)))

(provide 'settings)

;;; settings.el ends here

;;; init.el --- Emacs initialisation File

;; Filename: init.el
;; Description: Emacs initialisation File
;; Author: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Maintainer: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Copyright (C) 2014, Philipp Spliethoff, all rights reserved.
;; Created: 2014-03-02 13:55:00
;; Version: 0.1
;; Last-Updated: 2014-03-02 13:55:00
;;           By: Philipp Spliethoff
;; URL: https://github.com/endoplasma/.emacs.d/init.el
;; Keywords: init.el, .emacs, emacs
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
;; Emacs initialisation File 
;;
;;This file handles the basci initialisation of emacs.  The initialisation
;; process is split up into multiple files, which are called from this script.
;;
;; This script uses the el-get package to download an initialise aditional
;; packages, which should be platform independet. (testet only for linux yet)
;; For more Info on el-get visit https://github.com/dimitri/el-get or
;; http://www.emacswiki.org/emacs/el-get

;;; Change log:
;;	
;; 2014/03/02
;;      * First released.
;; 

;;; TODO
;;
;; Test initialisation for windows and mac os
;;

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
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/key-bindings.el")


;;(load "~/.emacs.d/custom.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("471877df61bcd989ba4c0a5097654684fcfe918e124d46f811b533e44df34f53" default)))
 '(ecb-options-version "2.40")
 '(safe-local-variable-values (quote ((require-final-newline)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init.el)

;;; init.el ends here



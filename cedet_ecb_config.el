;;; cedet_ecb_config.el --- configure cedet and ecb options

;; Filename: cedet_ecb_config.el
;; Description: configure cedet and ecb options
;; Author: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Maintainer: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Copyright (C) 2014, Philipp Spliethoff, all rights reserved.
;; Created: 2014-11-16 16:10:35
;; Version: 0.1
;; Last-Updated: 2014-11-16 16:10:35
;;           By: Philipp Spliethoff
;; URL: https://github.com/endoplasma/.emacs.d/cedet_ecb_config.el
;; Keywords: cedet, ecb
;; Compatibility: GNU Emacs 24.4.1
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
;; configure cedet and ecb options
;;
;; This file handles all cedet and ecb configuration options. It is
;; used to have all configuration Options in one place and not
;; dirstributed throughout several files. This file is called from
;; init.el

;;; Change log:
;;	
;; 2014/11/16
;;      * First released.
;; 

;;; TODO
;;
;; Fill
;;

;;; Code:


;;; emacs-rc-cedet.el --- copied from alex odd

(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)

;;(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)
;;(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)

;; Activate semantic
(semantic-mode 1)

(require 'semantic/bovine/c)
;;(require 'semantic/bovine/clang)

(require 'cedet-files)

;; loading contrib...
;;(require 'eassist)

(require 'ecb)

;; customisation of modes
(defun alexott/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
;;  (local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
  ;;  (local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block)
  (local-set-key "\C-c,f" 'senator-fold-tag-toggle)

  (add-to-list 'ac-sources 'ac-source-semantic)
  )
;; (add-hook 'semantic-init-hooks 'alexott/cedet-hook)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
 ;; (local-set-key "." 'semantic-complete-self-insert)
 ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)

  (add-to-list 'ac-sources 'ac-source-gtags)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

(setq ede-locate-setup-options
      '(ede-locate-global
	ede-locate-base))

;;(setq-default semantic-symref-tool "global")


(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))

;; SRecode
(global-srecode-minor-mode 1)

;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects)


;; helper for boost setup...
(defun c++-setup-boost (boost-root)
  (when (file-accessible-directory-p boost-root)
    (let ((cfiles (cedet-files-list-recursively boost-root "\\(config\\|user\\)\\.hpp")))
      (dolist (file cfiles)
        (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))


;; my functions for EDE
(defun alexott/ede-get-local-var (fname var)
  "fetch given variable var from :local-variables of project of file fname"
  (let* ((current-dir (file-name-directory fname))
         (prj (ede-current-project current-dir)))
    (when prj
      (let* ((ov (oref prj local-variables))
            (lst (assoc var ov)))
        (when lst
          (cdr lst))))))

;; setup compile package
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(defun alexott/compile ()
  "Saves all unsaved buffers, and runs 'compile'."
  (interactive)
  (save-some-buffers t)
  (let* ((fname (or (buffer-file-name (current-buffer)) default-directory))
	 (current-dir (file-name-directory fname))
         (prj (ede-current-project current-dir)))
    (if prj
	(project-compile-project prj)
	(compile compile-command))))
(global-set-key [f9] 'alexott/compile)

;;
(defun alexott/gen-std-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj)))
    (concat "cd " root-dir "; make -j2")))

;;
(defun alexott/gen-cmake-debug-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj))
         (subdir "")
         )
    (when (string-match root-dir current-dir)
      (setf subdir (substring current-dir (match-end 0))))
    (concat "cd " root-dir "Debug/" "; make -j3")))


;;; Projects

;; (ede-cpp-root-project "wiccad"
;;                 :name "Wiccad Backbone"
;;                 :file "~/Workspace/wiccad/Projects/Backbone_F407/Makefile"
;;                 :include-path '("/"
;;                                 "src"
;; 				"src/usb"
;; 				"src/transceiver"
;; 				"src/spielwiese1"
;; 				"src/spielwiese3"
;; 				"src/http"
;;                                 "inc"
;; 				"inc/usb"
;; 				"inc/transceiver"
;; 				"inc/spielwiese1"
;; 				"inc/spielwiese3"
;; 				"inc/http"
;;                                 "libs"
;; 				"libs/CMSIS/Device/ST/STM32F4xx/Include"
;; 				"libs/CMSIS/Include"
;; 				"libs/fatfs"
;; 				"libs/STM32F4xx_HAL_Driver/Inc"
;; 				"libs/STM32F4xx_HAL_Driver/Src"
;; 				"libs/STM32_USB_Device_Library/Core/Src"
;; 				"libs/STM32_USB_Device_Library/Core/Inc"
;; 				"inc/transceiver"
;;                                )
;;                 :spp-table '(("isUnix" . ""))
;; 		:compile-command "cd ~/Workspace/wiccad/Projects/Backbone_F407/  && make -j2 PLATFORM=linux"
;; 		)

;; cpp-tests project definition
;; (when (file-exists-p "~/Workspace/wiccad/Projects/Backbone_F407/Makefile")
;;   (setq wiccad-project
;; 	(ede-cpp-root-project "wiccad_BB"
;; 			      :file "~/Workspace/wiccad/Projects/Backbone_F407/Makefile"
;; 			      :system-include-path '("/home/ott/exp/include"
;; 						     boost-base-directory)
;; 			      :compile-command "cd Debug && make -j2"
;; 			      )))


;; Setup JAVA....
;; (require 'semantic/db-javap)

;; example of java-root project

;; (ede-ant-project "Lucene" 
;; 		       :file "~/work/lucene-solr/lucene-4.0.0/build.xml"
;; 		       :srcroot '("core/src")
;; 		       :classpath (cedet-files-list-recursively "~/work/lucene-solr/lucene-4.0.0/" ".*\.jar$")
;; 		       )



(provide 'cedet_ecb_config.el)

;;; cedet_ecb_config.el ends here


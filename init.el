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
       '(el-get
	 auctex
	 switch-window
	 auto-complete
	 color-theme-zenburn
	 cedet
	 smartparens
	 org-mode
	 vhdl-mode
	 yasnippet
	 projectile
	 helm
	 flycheck
	 magit
	 markdown-mode
	 cmake-mode
	 ggtags
;	 projectile-speedbar
	 doxymacs
	 matlab-mode
	 )))

;; install new packages and init already installed packages
(el-get 'sync my-el-get-packages)

;; Load Path for extensions
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/misc.el")
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/key-bindings.el")
;;(load "~/.emacs.d/cedet_ecb_config.el")


;; (ede-cpp-root-project "WICCAD"
;; 	 :file "~/Workspace/wiccad/Projects/Backbone_F407/Makefile"
;;          :include-path '("/inc"
;; 			 "/inc/http"
;; 			 "/inc/usb"
;; 			 "/inc/transceiver"
;; 			 "/inc/spielwiese1"
;; 			 "/inc/spielwiese2"
;; 			 "/libs"
;; 			 "/libs/CMSIS/Device/ST/STM32F4xx/Include"
;; 			 "/libs/CMSIS/Include"
;; 			 "/libs/fatfs"
;; 			 "/libs/STM32F4xx_HAL_Driver/Inc"
;; 			 "/libs/STM32F4xx_HAL_Driver/Src"
;; 			 "/libs/STM32_USB_Device_Library/Core/Src"
;; 			 "/libs/STM32_USB_Device_Library/Core/Inc"
;; 			 )
;; 	 :spp-table '(("isUnix" . ""))
;; 	 :compile-command "cd ~/Workspace/wiccad/Projects/Backbone_F407/  && make -j2 PLATFORM=linux"
;; 	 )

;; (ede-cpp-root-project "wiccad-david"
;;                 :name "Wiccad Backbone release"
;;                 :file "~/Workspace/wiccad/david/Backbone_F407/Makefile"
;;                 :include-path '("/"
;;                                 "/src"
;; 				"/src/basestation/"
;; 				"/src/basestation_proto/"
;; 				"/src/device_proto/"
;; 				"/src/mixer/"
;; 				"/src/mp3/"
;; 				"/src/network/"
;; 				"/src/protoConfig/"
;; 				"/src/protokoll/"
;; 				"/src/sd_lcd/"
;; 				"/src/spielwiese1/"
;; 				"/src/spielwiese3/"
;; 				"/src/transceiver/"
;; 				"/src/usb/"
;;                                 "/inc"
;; 				"/inc/basestation/"
;; 				"/inc/basestation_proto/"
;; 				"/inc/device_proto/"
;; 				"/inc/mixer/"
;; 				"/inc/mp3/"
;; 				"/inc/network/"
;; 				"/inc/protoConfig/"
;; 				"/inc/protokoll/"
;; 				"/inc/sd_lcd/"
;; 				"/inc/spielwiese1/"
;; 				"/inc/spielwiese3/"
;; 				"/inc/transceiver/"
;; 				"/inc/usb/"
;;                                 "/libs"
;; 				"/libs/CMSIS/Device/ST/STM32F4xx/Include"
;; 				"/libs/CMSIS/Include"
;; 				"/libs/fatfs"
;; 				"/libs/STM32F4xx_HAL_Driver/Inc"
;; 				"/libs/STM32F4xx_HAL_Driver/Src"
;; 				"/libs/STM32_USB_Device_Library/Core/Src"
;; 				"/libs/STM32_USB_Device_Library/Core/Inc"
;;                                )
;;                 :spp-table '(("isUnix" . ""))
;; 		:compile-command "cd ~/Workspace/wiccad/david/Backbone_F407/  && make -f Makefile.linux -j2 PLATFORM=linux BUILDCONFIG=1"
;; 		)

;; (ede-cpp-root-project "wiccad-testbench"
;;                 :name "Wiccad testbench"
;;                 :file "~/Workspace/wiccad/Projects/TestBench/Makefile"
;;                 :include-path '("/"
;;                                 "/src"
;; 				"/src/basestation/"
;; 				"/src/basestation_proto/"
;; 				"/src/device_proto/"
;; 				"/src/mixer/"
;; 				"/src/mp3/"
;; 				"/src/network/"
;; 				"/src/protoConfig/"
;; 				"/src/protokoll/"
;; 				"/src/sd_lcd/"
;; 				"/src/spielwiese1/"
;; 				"/src/spielwiese3/"
;; 				"/src/transceiver/"
;; 				"/src/usb/"
;;                                 "/inc"
;; 				"/inc/basestation/"
;; 				"/inc/basestation_proto/"
;; 				"/inc/device_proto/"
;; 				"/inc/mixer/"
;; 				"/inc/mp3/"
;; 				"/inc/network/"
;; 				"/inc/protoConfig/"
;; 				"/inc/protokoll/"
;; 				"/inc/sd_lcd/"
;; 				"/inc/spielwiese1/"
;; 				"/inc/spielwiese3/"
;; 				"/inc/transceiver/"
;; 				"/inc/usb/"
;;                                 "/libs"
;; 				"/libs/CMSIS/Device/ST/STM32F4xx/Include"
;; 				"/libs/CMSIS/Include"
;; 				"/libs/fatfs"
;; 				"/libs/STM32F4xx_HAL_Driver/Inc"
;; 				"/libs/STM32F4xx_HAL_Driver/Src"
;; 				"/libs/STM32_USB_Device_Library/Core/Src"
;; 				"/libs/STM32_USB_Device_Library/Core/Inc"
;;                                )
;;                 :spp-table '(("isUnix" . ""))
;; 		:compile-command "cd ~/Workspace/wiccad/Projects/TestBench/  && make -f Makefile.linux -j2 PLATFORM=linux BUILDCONFIG=1"
;; 		)

;; (ede-cpp-root-project "wiccad-MP3"
;; 		      :name "Wiccad MP3 Player"
;; 		      :file "~/Workspace/wiccad/david/MP3_F407/Makefile"
;; 		      :include-path '("/"
;; 				      "/libs"
;; 				      "/libs/CMSIS"
;; 				      "/libs/CMSIS/Include"
;; 				      "/libs/CMSIS/Device"
;; 				      "/libs/CMSIS/Device/ST"
;; 				      "/libs/CMSIS/Device/ST/STM32F4xx"
;; 				      "/libs/CMSIS/Device/ST/STM32F4xx/Include"
;; 				      "/libs/helix"
;; 				      "/libs/helix/pub"
;; 				      "/libs/helix/real"
;; 				      "/libs/STM32F4xx_StdPeriph_Driver"
;; 				      "/libs/STM32F4xx_StdPeriph_Driver/src"
;; 				      "/libs/STM32F4xx_StdPeriph_Driver/inc"
;; 				      "/out"
;; 				      "/src"
;; 				      "/incrojects"
;; 				      )
;; 		      :spp-table '(("isUnix" . ""))
;; 		      :compile-command "cd ~/Workspace/wiccad/david/MP3_F407/  && make -f Makefile.linux -j2 PLATFORM=linux BUILDCONFIG=1"
;; 		      )

;; (ede-cpp-root-project "MA_sim"
;; 		      :name "Matlab Simulation for MA"
;; 		      :file "~/Documents/Uni/MA/MA_git/matlab/sim/README"
;; 		      :include-path '("/"
;; 				      )
;; 		      :spp-table '(("isUnix" . ""))
;; 		      )


;;(load "~/.emacs.d/custom.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote luatex))
 '(custom-safe-themes
   (quote
    ("471877df61bcd989ba4c0a5097654684fcfe918e124d46f811b533e44df34f53" default)))
 '(ecb-eshell-auto-activate t)
 '(ecb-eshell-buffer-sync nil)
 '(ecb-options-version "2.40")
 '(ecb-source-path nil)
 '(safe-local-variable-values
   (quote
    ((eval flyspell-buffer)
     (eval ispell-change-dictionary "en_GB")
     (require-final-newline)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)


(provide 'init.el)

;;; init.el ends here

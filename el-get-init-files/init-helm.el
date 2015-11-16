;;; init-helm.el --- Initialisation Setting for helm mode

;; Filename: init-helm.el
;; Description: Initialisation Setting for helm mode
;; Author: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Created: 2014-06-04 14:13:47
;; Version: 0.1
;; Last-Updated: 2014-06-04 14:13:47
;;           By: Philipp Spliethoff
;; URL: https://github.com/endoplasma/.emacs.d/init-helm.el
;; Keywords: helm mode
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
;; Initialisation Setting for helm mode
;; This File is executed after the helm package is loaded. All helm
;; specific setting shall go here.

;;; Code:

;; activate global helm mode for all completion buffers
(helm-mode 1)

;;; init-helm.el ends here

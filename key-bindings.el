;;; key-bindings.el --- general key binding definitions.

;; Filename: key-bindings.el
;; Description: general key binding definitions.
;; Author: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Created: 2014-03-02 14:09:00
;; Version: 0.1
;; Last-Updated: 2014-03-02 14:09:00
;;           By: Philipp Spliethoff
;; URL: https://github.com/endoplasma/.emacs.d/key-bindings.el
;; Keywords: key-bindings, emacs
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

;; Commentary: 
;;
;; general key binding definitions.
;;

;;; Code:

(global-set-key (kbd "C-c C-r") 'comment-or-uncomment-region-or-line)

;; C-c C-r gets overwritten by ecb
(global-set-key (kbd "C-c C-t") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-c C-x t") 'comment-or-uncomment-region-or-line)


(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-<f2>") 'nv-speedbar-open-current-buffer-in-tree)

;;; key-bindings.el ends here


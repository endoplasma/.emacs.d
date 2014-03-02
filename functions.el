;;; functions.el --- user defined functions for emacs

;; Filename: functions.el
;; Description: user defined functions for emacs
;; Author: Philipp Spliethoff <philipp.spliethoff@tu-dortmund.de>
;; Created: 2014-03-02 14:07:29
;; Version: 0.1
;; Last-Updated: 2014-03-02 14:07:29
;;           By: Philipp Spliethoff
;; URL: https://github.com/endoplasma/.emacs.d/functions.el
;; Keywords: functions, emacs, init
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
;; user defined functions for emacs
;; My userdefined functions, which do not fit into an own package go here

;;; Code:

;;; very usefull function to comment a region or line weather a region
;;; is defined or not
;;; source was http://vickychijwani.github.io/2013/02/13/nuggets-from-my-emacs-part-i/
(defun comment-or-uncomment-region-or-line ()
  "Like comment-or-uncomment-region, but if there's no mark \(that means no
region\) apply comment-or-uncomment to the current line"
  (interactive)
  (if (not mark-active)
      (comment-or-uncomment-region
       (line-beginning-position) (line-end-position))
    (if (< (point) (mark))
        (comment-or-uncomment-region (point) (mark))
      (comment-or-uncomment-region (mark) (point)))))


(defun my-set-monospaced-font ()
  "Set a monospaced font, for modes with programming languages"
  (interactive)
  (setq buffer-face-mode-face '(:family "Inconsolata" :height 110))
  (buffer-face-mode)
  )

(defun my-set-normal-font ()
  "Set a non-monospaced font, for modes with normal text"
  (interactive)
  (setq buffer-face-mode-face '(:family "Anonymous Pro" :height 100))
  (buffer-face-mode)
  )

;;; functions.el ends here

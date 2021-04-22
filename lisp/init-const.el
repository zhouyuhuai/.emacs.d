;; init-const.el --- Define constants.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Define constants.
;;

;;; Code:

(defconst sys/win32p
  (eq system-type 'windows-nt)
  "Are we running on a Windows system?")

(defconst sys/linuxp
  (eq system-type 'gnu/linux)
  "Are we running on GNU/Linux system?")

(defconst sys/linux-x-p
  (and (display-graphic-p) sys/linuxp)
  "Are we running on under X on a GNU/Linux system?")

(defconst sys/macp
  (eq system-type 'darwin)
  "Are we running on a Mac System?")

(defconst sys/mac-x-p
  (and (display-graphic-p) sys/macp)
  "Are we running under X on a Mac System?")


(provide 'init-const)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-const.el ends here

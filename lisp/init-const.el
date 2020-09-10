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


(provide 'init-const)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-const.el ends here

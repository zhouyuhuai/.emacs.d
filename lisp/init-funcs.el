;; init-funcs.el --- Define functions.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Define functions.
;;

;;; Code:

(require 'cl-lib)

(defun icons-displayable-p ()
  "Return non-nil if `all-the-icons' is displayable."
  (if (display-graphic-p)
       (require 'all-the-icons nil t)))

(provide 'init-funcs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-funcs.el ends here

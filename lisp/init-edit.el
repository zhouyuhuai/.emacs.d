;; init-edit.el --- Initialize editing configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Editing configurations.
;;

;;; Code:

(use-package avy
  :defer t
  :bind (("C-:" . avy-goto-char)))

(provide 'init-edit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here

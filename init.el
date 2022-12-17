;;; init.el --- Emacs Init Configuration. -*- lexical-binding: t; -*-

;; bootstrap
(require 'bootstrap)

;; temporary
(use-package company
  :hook (after-init . global-company-mode))

(use-package macrostep)

(use-package lispy
  :hook (emacs-lisp-mode . lispy-mode))

(use-package display-line-numbers
  :straight nil
  :hook (prog-mode . display-line-numbers-mode))
;; temporary

;;; init.el ends here.

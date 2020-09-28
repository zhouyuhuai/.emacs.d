;;; init.el --- A Fancy and Fast Emacs Configuration.	-*- lexical-binding: t no-byte-compile: t; -*-

;;; Commentary:
;;
;; Libra Emacs - A Fancy and Fast Emacs Configuration.
;;

;;; Code:

(when (version< emacs-version "27.1")
  (error "This requires Emacs 27.1 and above!"))

;; Load Path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(advice-add #'package-initialize :after #'update-load-path)

(update-load-path)

;; Packages
(require 'init-package)
(require 'init-basic)
(require 'init-evil)
(require 'init-general)
(require 'init-ui)
(require 'init-edit)
;;(require 'init-helm)
(require 'init-completion)
(require 'init-company)
(require 'init-utils)
(require 'init-vcs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here

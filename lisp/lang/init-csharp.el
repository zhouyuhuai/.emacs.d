;;; lang/init-csharp.el -*- lexical-binding: t; -*-

;;; Commentary:
;;
;;  Csharp - Csharp language Configuration.
;;

;;; Code:

(use-package csharp-mode)

(use-package omnisharp
  :commands omnisharp-install-server
  :hook
  (csharp-mode . omnisharp-mode)
  :init
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-omnisharp))
  (setq omnisharp-auto-complete-want-documentation nil
        omnisharp-cache-directory (concat user-emacs-directory "omnisharp")))

(use-package eldoc-box
  :hook (omnisharp-mode . eldoc-box-hover-mode)
  :init
  (setq eldoc-box-clear-with-C-g t
        eldoc-box-cleanup-interval 0.2))

(advice-add #'omnisharp-mode :after #'omnisharp-start-omnisharp-server)

(provide 'init-csharp)

;; init-csharp.el ends here

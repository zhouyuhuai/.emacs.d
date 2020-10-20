;;; init-dev.el --- Programming development -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; Lint tool
(use-package flycheck
  :diminish
  :commands flycheck-list-errors flycheck-redefine-standard-error-levels
  :hook (after-init . global-flycheck-mode)
  :init
  (setq flycheck-global-modes
        '(not text-mode outline-mode fundamental-mode lisp-interaction-mode
              org-mode diff-mode shell-mode eshell-mode term-mode vterm-mode
              emacs-lisp-mode))
  (setq flycheck-temp-prefix ".flycheck"
        flycheck-check-syntax-automatically '(save mode-enabled)
        flycheck-display-errors-delay 0.25
        flycheck-emacs-lisp-load-path 'inherit
        flycheck-indication-mode 'right-fringe)
  :config
  ;; Prettify indication styles
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'flycheck-fringe-bitmap-arrow
      [16 48 112 240 112 48 16] nil nil 'center))
  (flycheck-redefine-standard-error-levels "?" 'flycheck-fringe-bitmap-arrow)

  ;; Display Flycheck errors in GUI tooltips
  (if (display-graphic-p)
      (use-package flycheck-posframe
        :hook (flycheck-mode . flycheck-posframe-mode)
        :init (setq flycheck-posframe-inhibit-functions
                    '((lambda (&rest _) (bound-and-true-p company-backend)))))
    (use-package flycheck-pos-tip
      :defines flycheck-pos-tip-timeout
      :hook (flycheck-mode . flycheck-pos-tip-mode)
      :config (setq flycheck-pos-tip-timeout 30))))

;; Quickrun codes, including cpp. awesome!
(use-package quickrun
  :bind ("C-c x" . quickrun)
  :custom
  (quickrun-focus-p nil)
  (quickrun-input-file-extension ".qr"))

(use-package license
  :straight (:host github
             :repo "condy0919/license.el"
             :branch "master")
  :bind (:map prog-mode-map
         ("C-c i l" . license-insert))
  :custom
  (license-copyright-holder 'auto)
  (license-project-detection 'projectile))

;; Highlight todo
(use-package hl-todo
  :hook (after-init . global-hl-todo-mode)
  :bind (:map hl-todo-mode-map
         ("C-c t p" . hl-todo-previous)
         ("C-c t n" . hl-todo-next)
         ("C-c t o" . hl-todo-occur))
  :config
  (dolist (keyword '("BUG" "ISSUE" "NB"))
    (cl-pushnew `(,keyword . ,(face-foreground 'error)) hl-todo-keyword-faces)))

;; XML
(use-package nxml-mode
  :straight nil
  :magic "<\\?xml"
  :mode (("\\.xml\\'" . nxml-mode)
         ("\\.rss\\'" . nxml-mode))
  :custom
  (nxml-slash-auto-complete-flag t)
  (nxml-auto-insert-xml-declaration-flag t))

;; Config files mode
(use-package yaml-mode
  :mode (("\\.yaml\\'" . yaml-mode)
         ("\\.yml\\'"  . yaml-mode)))

;; Projectile.
(require 'init-projectile)

;; Treemacs.
(require 'init-treemacs)

;; TODO: require  language here
(require 'init-csharp)

(provide 'init-dev)

;;; init-dev.el ends here

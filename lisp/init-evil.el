;;; init-evil.el --- Bring vim back -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; Vi
(use-package evil
  :hook (after-init . evil-mode)
  :bind (:map evil-normal-state-map
              ("gs" . evil-avy-goto-char-timer)
              ("go" . evil-avy-goto-word-or-subword-1)
              ("gl" . evil-avy-goto-line))
  :config (evil-ex-define-cmd "q[uit]" 'kill-this-buffer)
  :custom
  (evil-ex-complete-emacs-commands nil)
  (evil-want-integration t)
  (evil-want-keybinding nil))

(use-package evil-collection
  :hook (evil-mode . evil-collection-init)
  :config
  (dolist (ig-mode '())
    (setq evil-collection-mode-list (remove ig-mode evil-collection-mode-list)))
  :custom
  (evil-collection-setup-minibuffer nil))

(use-package evil-surround
  :hook (after-init . global-evil-surround-mode))

(use-package evil-magit
  :after evil magit)

(provide 'init-evil)

;;; init-evil.el ends here

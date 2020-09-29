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
  :preface
  (setq evil-want-visual-char-semi-exclusive t
        evil-ex-search-vim-style-regexp t
        evil-ex-substitute-global t
        evil-ex-visual-char-range t  ; column range for ex commands
        evil-mode-line-format 'nil
        ;; more vim-like behavior
        evil-symbol-word-search t
        ;; cursor appearance
        evil-default-cursor '+evil-default-cursor-fn
        evil-normal-state-cursor 'box
        evil-emacs-state-cursor  '(box +evil-emacs-cursor-fn)
        evil-insert-state-cursor 'bar
        evil-visual-state-cursor 'hollow
        ;; Only do highlighting in selected window so that Emacs has less work
        ;; to do highlighting them all.
        evil-ex-interactive-search-highlight 'selected-window)
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
  :hook (evil-mode . global-evil-surround-mode))

(use-package evil-magit
  :after evil magit)

(provide 'init-evil)

;;; init-evil.el ends here

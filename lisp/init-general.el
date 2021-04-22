;; init-general.el --- Initialize general.

;;; Commentary:
;;
;; General * Global Keybind *
;;

;;; Code:

(use-package general
  :after evil
  :config
  (general-create-definer libra-leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "M-m"
    :keymaps 'override)

  (libra-leader-def
    ;; file
    "f" '(:ignore t :which-key "file")
    "ff" 'counsel-find-file
    "fF" 'find-file-other-window

    ;; dired
    "d" '(:ignore t :which-key "dired")
    "dj" 'dired-jump
    "dJ" 'dired-jump-other-window

    ;; buffer & bookmarks
    "b" '(:ignore t :which-key "buffer & mark")
    "bb" 'counsel-switch-buffer
    "bB" 'switch-to-buffer-other-window

    ;; git
    "g" '(:ignore t :which-key "git")
    "gb" 'magit-branch-checkout
    "gB" 'magit-blame-addition
    "gc" 'magit-branch-and-checkout
    "gC" 'magit-commit-create
    "gd" 'magit-diff
    "gf" 'magit-find-file
    "gg" 'magit-status
    "gG" 'magit-status-here
    "gi" 'magit-init
    "gr" 'magit-rebase-interactive

    ;; search
    "s" '(:ignore t :which-key "search")
    "sa" 'swiper-all
    "sb" 'swiper
    "sg" 'counsel-rg
    "si" 'imenu
    "sj" 'evil-show-jumps
    "sm" 'evil-show-marks
    "sr" 'evil-show-registers
    "ss" 'swiper-isearch
    "sS" 'swiper-isearch-thing-at-point)

  (general-create-definer libra-local-leader-def
    :prefix "SPC l"
    :non-normal-prefix "M-m l")

  (libra-local-leader-def
    :states '(normal visual insert emacs)
    :keymaps 'org-mode-map
    "" '(:ignore t :wk "org")
    "." 'counsel-org-goto
    "/" 'counsel-org-goto-all)
  :custom
  (general-implicit-kbd t)
  (general-override-auto-enable t))

(provide 'init-general)

;; init-general.el ends here

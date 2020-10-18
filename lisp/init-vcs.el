;; init-vcs.el --- Initialize version control system configurations.	-*- lexical-binding: t -*-


;;; Commentary:
;;
;; Version control systems.
;;

;;; Code:

;; The awesome git client
(use-package magit
  :mode (("\\COMMIT_EDITMSG\\'" . text-mode)
         ("\\MERGE_MSG\\'" . text-mode))
  :init (use-package magit-gitflow :hook (magit-mode . turn-on-magit-gitflow))
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch))
  :custom
  ;; Supress message
  (magit-no-message '("Turning on magit-auto-revert-mode..."))
  (magit-save-repository-buffers 'dontask)
  (magit-process-popup-time 30)
  (magit-ediff-dwim-show-on-hunks t)
  (magit-diff-refine-hunk t))

;; Todo integration
(use-package magit-todos
  :hook (magit-status-mode . magit-todos-mode))

;; NB `diff-hl' depends on `vc'
(use-package vc
  :config
  ;; Disable vc for remote files, and `diff-hl' won't work as expected.
  (setq vc-ignore-dir-regexp (format "\\(%s\\)\\|\\(%s\\)"
                                     vc-ignore-dir-regexp
                                     tramp-file-name-regexp))
  :custom
  (vc-follow-symlinks t)
  (vc-handled-backends '(Git)))

;; Highlight uncommited changes using git
(use-package diff-hl
  :hook
  ((after-init . (lambda ()
                   (global-diff-hl-mode)
                   (diff-hl-flydiff-mode)))
   (magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh)
   (dired-mode . diff-hl-dired-mode-unless-remote)))

;; Pop up last commit info of current line
(use-package git-messenger
  :bind (:map vc-prefix-map
         ("p" . git-messenger:popup-message)
         :map git-messenger-map
         ("m" . git-messenger:copy-message))
  :custom
  (git-messenger:show-detail t)
  (git-messenger:use-magit-popup t))
(provide 'init-vcs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-vcs.el ends here

;; init-vcs.el --- Initialize version control system configurations.	-*- lexical-binding: t -*-


;;; Commentary:
;;
;; Version control systems.
;;

;;; Code:

(use-package magit
  :mode (("\\COMMIT_EDITMSG\\'" . text-mode)
         ("\\MERGE_MSG\\'" . text-mode))
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-popup))
  :init
  (setq magit-diff-refine-hunk t)
  (use-package magit-gitflow :hook (magit-mode . turn-on-magit-gitflow)))

(provide 'init-vcs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-vcs.el ends here

;;; init-helm.el --- Emacs framework for incremental completions and narrowing selections Configuration.	-*- lexical-binding: t no-byte-compile: t; -*-

;;; Commentary:
;;
;; Emacs framework for incremental completions and narrowing selections Configuration.
;;

;;; Code:

(use-package helm
  :config
  (setq helm-imenu-delimiter ": ")
  :preface
  (setq helm-candidate-number-limit 50
        helm-display-buffer-width nil
        helm-display-buffer-height 0.25
        helm-display-header-line nil
        helm-find-files-doc-header nil)
  :bind (("M-x" . helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("C-x C-r" . helm-recentf)))

(use-package swiper
  :config
  (setq ivy-height 20))

(use-package swiper-helm
  :bind ("C-s" . swiper-helm))

(use-package helm-flx
  :hook (helm-mode . helm-flx-mode))

(use-package helm-descbinds
  :hook (helm-mode . helm-descbinds-mode))

(provide 'init-helm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-helm.el ends here

;; init-completion.el --- Initialize Completion Framework Configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Completion Framework Configurations.
;;

;;; Code:


;; Ivy
(use-package ivy
  :init
  (use-package swiper :defer t)
  (use-package counsel)
  (use-package ivy-avy)
  :bind (("M-x" . counsel-M-x)

         ("C-s" . swiper-isearch)
         ("C-r" . swiper-isearch-backward)
         ("C-S-s" . swiper-all)
         ("C-S-p" . swiper-isearch-thing-at-point)
         ("C-'" . ivy-avy)

         ("C-x C-f" . counsel-find-file)
         ("C-x O" . counsel-find-file-extern)

         ("C-x b" . ivy-switch-buffer)
         ("C-c C-r" . ivy-resume)
         ("C-c v p" . ivy-push-view)
         ("C-c v o" . ivy-pop-view)
         ("C-c v s" . ivy-switch-view)

         :map ivy-minibuffer-map
         ("C-'" . ivy-avy))
  :config
  (setq ivy-sort-max-size 1000)
  (setq ivy-height 17
        ivy-wrap t
        ivy-fixed-height-minibuffer t
        ;; disable magic slash on non-match
        ivy-magic-slash-non-match-action nil
        ;; don't show recent files in switch-buffer
        ivy-use-virtual-buffers nil
        ;; ...but if that ever changes, show their full path
        ivy-virtual-abbreviate 'full
        ;; don't quit minibuffer on delete-error
        ivy-on-del-error-function #'ignore
        ;; enable ability to select prompt (alternative to `ivy-immediate-done')
        ivy-use-selectable-prompt t)

  ;; Icons
  (use-package all-the-icons-ivy
    :after ivy
    :config
    (setq all-the-icons-ivy-buffer-commands nil)
    (all-the-icons-ivy-setup))

  ;; Better sorting and filtering
  (use-package prescient
    :commands prescient-persist-mode)

  (use-package ivy-prescient
    :commands ivy-prescient-re-builder)
  )

(use-package ivy-rich
  :config
  (setq ivy-rich-path-style 'abbrev)
  (ivy-rich-mode 1))

;; Snails
(when (display-graphic-p)
  (use-package snails
    :straight (:host github
               :repo "manateelazycat/snails"
               :branch "master")
    :config
    (defun snails-everywhere()
      (interactive)
      (snails '(snails-backend-everything)))))

(provide 'init-completion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-completion.el ends here

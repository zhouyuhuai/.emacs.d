;; init-utils.el --- Initialize ultilities.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Some usefule Utilities.
;;

;;; Code:


;; Misc
(use-package list-environment)
(use-package esup)

;; Restart Emacs
(use-package restart-emacs)

;; Which Key
(use-package which-key
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 0.5))

;; GC optimization
(use-package gcmh
  :ensure t
  :hook (after-init . gcmh-mode)
  :custom
  (gcmh-idle-delay 5)
  (gcmh-high-cons-threshold (* 16 1024 1024))) ;; 16 MB

(provide 'init-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-utils.el ends here

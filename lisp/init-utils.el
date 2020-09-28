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

(provide 'init-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-utils.el ends here

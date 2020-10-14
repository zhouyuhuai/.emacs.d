;; init-org.el --- Initialize org configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Org configurations.
;;

;;; Code:

(use-package org
  :straight nil
  :bind (("C-c c" . org-capture)))

;; Pretty symbols
(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :custom
  ;; hide leading stars, rendering in spaces
  (org-hide-leading-stars nil)
  (org-superstar-leading-bullet ?\s))

(provide 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here

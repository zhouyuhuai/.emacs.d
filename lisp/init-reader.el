;; init-reader.el --- Initialize readers.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; EPUB/RSS readers.
;;

;;; Code:

(require 'init-funcs)

;; Atom/RSS reader
(use-package elfeed
  :bind (("C-x w" . elfeed)
         :map elfeed-show-mode-map
         ("q" . #'delete-window))
  :hook (elfeed-show-mode . libra-read-mode)
  :init (setq url-queue-timeout 30
              elfeed-db-directory (locate-user-emacs-file ".elfeed")
              elfeed-show-entry-switch #'pop-to-buffer
              elfeed-show-entry-delete #'delete-window
              elfeed-feeds '(("https://rsshub.app/novel/biqugeinfo/57_57032" novel)))
  :config (push elfeed-db-directory recentf-exclude))

(use-package elfeed-web)

(provide 'init-reader)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-reader.el ends here

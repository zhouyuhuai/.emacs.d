;; init-python.el --- Initialize python configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:

;; Python Mode
(use-package python
  :ensure nil
  :hook (inferior-python-mode . (lambda ()
                                  (process-query-on-exit-flag
                                   (get-process "Python"))))
  :init
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  :config
  (when (and (executable-find "python3")
             (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))

  ;; Env vars

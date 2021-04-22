;; init-python.el --- Initialize python configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:

;; Python Mode
(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode)
  :functions (python-update-tools)
  :hook (inferior-python-mode . (lambda ()
                                  (process-query-on-exit-flag
                                   (get-process "Python"))))
  :init
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil
        python-indent-guess-indent-offset-verbose nil)
  :config
  (when (and (executable-find "python3")
             (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))

  ;; Env vars
  (with-eval-after-load 'exec-shell-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))

  ;; Live Coding in Python
  (use-package live-py-mode)

  ;; Python -m venv Env_DIR
  (use-package pyvenv
    :after python))

(provide 'init-python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here

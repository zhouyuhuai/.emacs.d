;;; init-lsp.el --- The completion engine and lsp client -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; lsp-mode
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (prog-mode . (lambda ()
                        (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'csharp-mode)
                          (lsp-deferred)))))
  :bind (:map lsp-mode-map
         ("C-c f" . lsp-format-region)
         ("C-c d" . lsp-describe-thing-at-point)
         ("C-c a" . lsp-execute-code-action)
         ("C-c r" . lsp-rename))
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-enable-links nil)                 ;; no clickable links
  (lsp-enable-folding nil)               ;; use `hideshow' instead
  (lsp-enable-snippet nil)               ;; no snippet
  (lsp-enable-file-watchers nil)         ;; turn off for better performance
  (lsp-enable-text-document-color nil)   ;; as above
  (lsp-enable-semantic-highlighting nil) ;; as above
  (lsp-enable-symbol-highlighting nil)   ;; as above
  (lsp-enable-indentation nil)           ;; indent by ourself
  (lsp-enable-on-type-formatting nil)    ;; disable formatting on the fly
  (lsp-modeline-code-actions-enable nil) ;; keep modeline clean
  (lsp-modeline-diagnostics-enable nil)  ;; as above
  (lsp-idle-delay 0.5)                   ;; lazy refresh
  (lsp-log-io nil)                       ;; enable log only for debug
  (lsp-diagnostics-provider :flycheck)   ;; prefer `flycheck'
  (lsp-lens-enable t)                    ;; enable lens
  (lsp-auto-guess-root t)                ;; auto guess root
  (lsp-keep-workspace-alive nil)         ;; auto kill lsp server
  (lsp-eldoc-enable-hover nil)           ;; disable eldoc hover
  (lsp-signature-auto-activate t)        ;; show function signature
  (lsp-signature-doc-lines 2))           ;; but dont take up more lines

;; Jump to workspace symbol
(use-package lsp-ivy
  :commands my/lsp-ivy-workspace-symbol
  :config
  (defun my/lsp-ivy-workspace-symbol ()
    "A `lsp-ivy-workspace-symbol' wrapper that effective only in `lsp-mode'."
    (interactive)
    (when (bound-and-true-p lsp-mode)
      (call-interactively 'lsp-ivy-workspace-symbol))))

;; Python: pyright
(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

(provide 'init-lsp)

;;; init-lsp.el ends here

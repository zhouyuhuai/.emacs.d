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

;; `lsp-mode' and `treemacs' integration
(use-package lsp-treemacs
       :after lsp-mode
       :bind (:map lsp-mode-map
              ("C-<f8>" . lsp-treemacs-errors-list)
              ("M-<f8>" . lsp-treemacs-symbols))
       :init (lsp-treemacs-sync-mode 1)
       :config
       (with-eval-after-load 'ace-window
         (when (boundp 'aw-ignored-buffers)
           (push 'lsp-treemacs-symbols-mode aw-ignored-buffers)
           (push 'lsp-treemacs-java-deps-mode aw-ignored-buffers)))

       (with-no-warnings
         (when (require 'all-the-icons nil t)
           (treemacs-create-theme "libra-colors"
             :extends "doom-colors"
             :config
             (progn
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "repo" :height 1.0 :v-adjust -0.1 :face 'all-the-icons-blue))
                :extensions (root))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "tag" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
                :extensions (boolean-data))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "settings_input_component" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-orange))
                :extensions (class))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "palette" :height 0.95 :v-adjust -0.15))
                :extensions (color-palette))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "square-o" :height 0.95 :v-adjust -0.15))
                :extensions (constant))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "file-text-o" :height 0.95 :v-adjust -0.05))
                :extensions (document))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "storage" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-orange))
                :extensions (enumerator))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "format_align_right" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-lblue))
                :extensions (enumitem))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "bolt" :height 0.95 :v-adjust -0.05 :face 'all-the-icons-orange))
                :extensions (event))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "tag" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
                :extensions (field))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "search" :height 0.95 :v-adjust -0.05))
                :extensions (indexer))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "filter_center_focus" :height 0.95 :v-adjust -0.15))
                :extensions (intellisense-keyword))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "share" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-lblue))
                :extensions (interface))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "tag" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
                :extensions (localvariable))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "cube" :height 0.95 :v-adjust -0.05 :face 'all-the-icons-purple))
                :extensions (method))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "view_module" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-lblue))
                :extensions (namespace))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "format_list_numbered" :height 0.95 :v-adjust -0.15))
                :extensions (numeric))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "control_point" :height 0.95 :v-adjust -0.2))
                :extensions (operator))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "wrench" :height 0.8 :v-adjust -0.05))
                :extensions (property))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "format_align_center" :height 0.95 :v-adjust -0.15))
                :extensions (snippet))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "text-width" :height 0.9 :v-adjust -0.05))
                :extensions (string))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "settings_input_component" :height 0.9 :v-adjust -0.15 :face 'all-the-icons-orange))
                :extensions (structure))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "format_align_center" :height 0.95 :v-adjust -0.15))
                :extensions (template))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "chevron-right" :height 0.75 :v-adjust 0.1 :face 'font-lock-doc-face))
                :extensions (collapsed) :fallback "+")
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "chevron-down" :height 0.75 :v-adjust 0.1 :face 'font-lock-doc-face))
                :extensions (expanded) :fallback "-")
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-binary" :height 0.9  :v-adjust 0.0 :face 'font-lock-doc-face))
                :extensions (classfile))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-blue))
                :extensions (default-folder-opened))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-blue))
                :extensions (default-folder))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-green))
                :extensions (default-root-folder-opened))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-green))
                :extensions (default-root-folder))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-binary" :height 0.9 :v-adjust 0.0 :face 'font-lock-doc-face))
                :extensions ("class"))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-zip" :height 0.9 :v-adjust 0.0 :face 'font-lock-doc-face))
                :extensions (file-type-jar))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
                :extensions (folder-open))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'font-lock-doc-face))
                :extensions (folder))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-orange))
                :extensions (folder-type-component-opened))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-orange))
                :extensions (folder-type-component))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-green))
                :extensions (folder-type-library-opened))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-green))
                :extensions (folder-type-library))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-pink))
                :extensions (folder-type-maven-opened))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-pink))
                :extensions (folder-type-maven))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'font-lock-type-face))
                :extensions (folder-type-package-opened))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'font-lock-type-face))
                :extensions (folder-type-package))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "plus" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
                :extensions (icon-create))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "list" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
                :extensions (icon-flat))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-material "share" :height 0.95 :v-adjust -0.2 :face 'all-the-icons-lblue))
                :extensions (icon-hierarchical))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "link" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
                :extensions (icon-link))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "refresh" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
                :extensions (icon-refresh))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "chain-broken" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
                :extensions (icon-unlink))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-alltheicon "java" :height 1.0 :v-adjust 0.0 :face 'all-the-icons-orange))
                :extensions (jar))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "book" :height 0.95 :v-adjust -0.05 :face 'all-the-icons-green))
                :extensions (library))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "folder-open" :face 'all-the-icons-lblue))
                :extensions (packagefolder-open))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
                :extensions (packagefolder))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-faicon "archive" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
                :extensions (package))
               (treemacs-create-icon
                :icon (format "%s " (all-the-icons-octicon "repo" :height 1.0 :v-adjust -0.1 :face 'all-the-icons-blue))
                :extensions (java-project))))

           (setq lsp-treemacs-theme "libra-colors"))))

;; Debug
(use-package dap-mode
  :functions dap-hydra/nil
  :bind (:map lsp-mode-map
              ("<f5>" . dap-debug)
              ("M-<f5>" . dap-hydra))
  :hook ((after-init . dap-mode)
         (dap-mode . dap-ui-mode)
         (dap-session-created . (lambda (_args) (dap-hydra)))
         (dap-stopped . (lambda (_args) (dap-hydra)))
         (dap-terminated . (lambda (_args) (dap-hydra/nil)))

         (python-mode . (lambda () (require 'dap-python)))
         (go-mode . (lambda () (require 'dap-go))))
  :init
  (setq dap-auto-configure-features '(sessions locals breakpoints expressions controls))
  (when (executable-find "python3")
    (setq dap-python-executable "python3")))

;; Python: pyright
(use-package lsp-pyright
  :hook (python-mode . (lambda () (require 'lsp-pyright)))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3")))

(provide 'init-lsp)

;;; init-lsp.el ends here

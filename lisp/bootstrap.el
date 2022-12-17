;;; bootstrap.el --- Bootstrap Emacs Configuration. -*- lexical-binding: t; -*-

;;; Commentary
;;; Emacs Bootstrap
;;; Code:

;; Bootstrap package manager `straight'
(setq straight-repository-branch "develop"
      straight-check-for-modifications nil
      straight-vc-git-default-clone-depth 1
      straight-use-package-by-default t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun add-subdirs-to-load-path (dir)
  "add subdirs to `load-path'"
  (when (file-directory-p dir)
    (let ((default-directory dir))
      (normal-top-level-add-subdirs-to-load-path))))

(add-subdirs-to-load-path *jc-config*)

(provide 'bootstrap)
;;; bootstrap.el ends here.

;;; early-init.el --- Jc's early-init.el -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:
;;; Jc's early-init.el

;;; Code:
(setq ffap-machine-p-known 'reject
      gc-cons-percentage 1.0
      gc-cons-threshold most-positive-fixnum
      idle-update-delay 1
      inhibit-compacting-font-caches t
      inhibit-default-init t
      inhibit-startup-message t
      inhibit-startup-screen t
      initial-major-mode 'fundamental-mode
      load-prefer-newer t
      native-comp-async-jobs-number 4
      package-enable-at-startup nil
      redisplay-skip-fontification-on-input t
      native-comp-async-report-warnings-errors 'silent)

(setq initial-scratch-message
      (concat
       ";; Happy hacking, "
       user-login-name
       " - Emacs ♥ you!\n\n"))

;; PATH
(defun emacs-base-path (path &optional base)
  "Return absolute PATH BASE OR `user-emacs-directory'"
  (expand-file-name path (or base user-emacs-directory)))

(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *jc-config* (emacs-base-path "lisp"))
(add-to-list 'load-path *jc-config* t)
(defconst *jc-dir* (emacs-base-path "tidy"))
(unless (file-directory-p *jc-dir*)
  (make-directory *jc-dir*))
(defconst *jc-etc* (emacs-base-path "etc" *jc-dir*))
(unless (file-directory-p *jc-etc*)
  (make-directory *jc-etc*))
(defconst *jc-var* (emacs-base-path "var" *jc-dir*))
(unless (file-directory-p *jc-var*)
  (make-directory *jc-var*))

(when (boundp 'native-comp-eln-load-path)
  (add-to-list 'native-comp-eln-load-path (expand-file-name "eln" *jc-var*)))

(when (fboundp 'startup-redirect-eln-cache)
  (convert-standard-filename
   (expand-file-name "eln" *jc-var*)))

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize '(tab-bar-lines menu-bar-lines))

;; Faster to disable these here (before they've been initialized)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; early-init.el ends here.

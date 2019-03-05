;;; init.el --- My emacs init script -*- lexical-binding: t -*-
;;; Commentary:
;;; https://github.com/wasamasa/dotemacs/blob/master/init.org
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
       (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defalias 'yes-or-no-p 'y-or-n-p)
                                        ;(add-to-list 'initial-frame-alist '(font . "Fira Code Retina-15"))
                                        ;(add-to-list 'default-frame-alist '(font . "Fira Code Retina-15"))
                                        ;(add-to-list 'initial-frame-alist '(font . "Hack-15"))
                                        ;(add-to-list 'default-frame-alist '(font . "Hack-15"))
(add-to-list 'initial-frame-alist '(font . "Iosevka-15"))
(add-to-list 'default-frame-alist '(font . "Iosevka-15"))
                                        ;(add-to-list 'initial-frame-alist '(font . "Envy Code R-15"))
                                        ;(add-to-list 'default-frame-alist '(font . "Envy Code R-15"))
                                        ;(toggle-frame-maximized)
(setq-default header-line-format '(:eval (which-function)))

(straight-use-package 'use-package)

(use-package magit
  :straight t
  :config
  (magit-define-popup-action 'magit-push-popup
    ?g
    "Push to gerrit"
    'magit-push-to-gerrit)
  (defun magit-push-to-gerrit (remote target)
    "Push to remote REMOTE to refs/for/TARGET."
    (interactive
      (let* (
              (remote (magit-read-remote "Remote" "origin"))
              (target (magit-read-remote-branch "Target branch" remote "master" nil)))
        (list remote target)))
    (magit-run-git-async "push" remote (format "HEAD:refs/for/%s" target))))

(use-package git-timemachine
  :straight t)

(use-package zenburn-theme
  :straight t
  :config (load-theme 'zenburn t))

(use-package whole-line-or-region
  :straight t
  :config (whole-line-or-region-global-mode))

(use-package ranger
  :straight t)

;;(use-package org-kanban
;;:straight t)

(use-package org-pomodoro
  :straight t)
(use-package magit-org-todos
  :straight t
  :config (magit-org-todos-autoinsert))

(use-package editorconfig
  :straight t
  :config (editorconfig-mode 1))

(use-package minions
  :straight t
  :config (minions-mode 1))

(defun my-d-mode-setup ()
  "Setup indent according to dfmt's defaults."
  (add-to-list 'c-offsets-alist
    '(substatement-open . 0)))

(use-package d-mode
  :straight t
  :config (add-hook 'd-mode-hook 'my-d-mode-setup))

(use-package helpful
  :straight t)

(use-package docker
  :straight t)
(use-package dockerfile-mode
  :straight t)
(use-package key-chord
  :straight t
  :config
  (key-chord-define-global "FF" 'helm-projectile)
  (key-chord-define-global "uu" 'undo-tree-visualize)
  (key-chord-define-global "xx" 'helm-M-x)
  (key-chord-define-global "BB" 'beginning-of-buffer)
  (key-chord-define-global "BE" 'end-of-buffer)
  (key-chord-define-global "bb" 'helm-mini)
  (key-chord-define-global "br" 'kill-buffer)
  (key-chord-define-global "bw" 'save-buffer)
  (key-chord-define-global "gs" 'magit-status)
  (key-chord-define-global "GG" 'goto-line)
  (key-chord-define-global "yy" 'helm-show-kill-ring)
  (key-chord-mode 1))

(use-package helm
  :straight t
  :config (helm-mode +1))

(use-package char-menu
  :straight t)

(use-package undo-tree
  :straight t)

(use-package projectile
  :straight t
  :config (projectile-mode 1))
(use-package projectile-rails
  :straight t
  :config (projectile-rails-global-mode 1))

(use-package helm-projectile
  :straight t)

(use-package company
  :straight t
  :config (global-company-mode 1))

(use-package exec-path-from-shell
  :straight t
  :config (exec-path-from-shell-initialize))

(use-package yaml-mode
  :straight t)

(use-package flycheck
  :straight t
  :config (global-flycheck-mode 1)
  :after (exec-path-from-shell))

(use-package helm-ag
  :straight t
  :config (global-set-key (kbd "M-s") 'helm-ag-project-root))

(use-package expand-region
  :straight t
  :config (global-set-key (kbd "C-M-w") 'er/expand-region))

;;(use-package markdown-mode
;;  :straight t)
;;
;;(use-package markdown-toc
;;  :straight t)

(use-package haml-mode
  :straight t)

(use-package multiple-cursors
  :straight t
  :config
  (global-set-key (kbd "M-n") 'mc/mark-next-like-this)
  (global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
  (global-set-key (kbd "M-a") 'mc/mark-all-like-this))

(use-package yasnippet
  :straight t
  :config (yas-global-mode 1))
(use-package yasnippet-snippets
  :straight t)
(use-package emmet-mode
  :straight t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook 'emmet-mode))

(use-package org-pomodoro
  :straight t)

(use-package plantuml-mode
  :straight t
  :config (plantuml-set-output-type "utxt"))
(use-package htmlize
  :straight t)
(use-package groovy-mode
  :straight t
  :config (add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode)))
(use-package lua-mode
  :straight t)
;;(use-package json-mode
;;:straight t)

;;(use-package highlight-symbol
;;  :straight t)
;;(use-package git-timemachine
;;:straight t)

(use-package diff-hl
  :straight t
  :config (global-diff-hl-mode 1))

(use-package ztree
  :straight t)

(use-package ecukes
  :straight t)

(use-package aggressive-indent
  :straight t
  :config (global-aggressive-indent-mode 1))

(use-package autorevert
  :straight t
  :config (global-auto-revert-mode))

(use-package anzu
  :straight t
  :config (global-anzu-mode +1))

(use-package move-text
  :straight t
  :config (move-text-default-bindings))

(use-package goto-chg
  :straight t)

;;(use-package workgroups2
;;  :straight t
;;  :config (workgroups-mode 1))

(use-package buffer-move
  :straight t)

(use-package which-key
  :straight t
  :config (which-key-mode 1))

(use-package deadgrep
  :straight t)

(use-package counsel
  :straight t)

(use-package swiper-helm
  :straight t)
(use-package command-log-mode
  :straight t)

(use-package dts-mode
  :straight t)

(use-package ggtags
  :straight t)

(use-package fzf
  :straight t)
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)

(add-to-list 'hs-special-modes-alist
  '(nxml-mode
     "<!--\\|<[^/>]*[^/]>"
     "-->\\|</[^/>]*[^/]>"

     "<!--"
     sgml-skip-tag-forward
     nil))

(add-hook 'nxml-mode-hook 'hs-minor-mode)

;; optional key bindings, easier than hs defaults
(define-key nxml-mode-map (kbd "C-c h") 'hs-toggle-hiding)

(defun my-i-search ()
  ""
  (interactive)
  (if (use-region-p)
    (let ((query (buffer-substring-no-properties (region-beginning) (region-end))))
      (message "searching for %s" query)
      (isearch-mode t)
      (isearch-yank-string query))
    (isearch-forward)))

(defun xah-search-current-word ()
  "Call `isearch' on current word or text selection.
“word” here is A to Z, a to z, and hyphen 「-」 and underline 「_」, independent of syntax table.
URL `http://ergoemacs.org/emacs/modernization_isearch.html'
Version 2015-04-09"
  (interactive)
  (let ( $p1 $p2 )
    (if (use-region-p)
      (progn
        (setq $p1 (region-beginning))
        (setq $p2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq $p1 (point))
        (right-char)
        (skip-chars-forward "-_A-Za-z0-9")
        (setq $p2 (point))))
    (setq mark-active nil)
    (when (< $p1 (point))
      (goto-char $p1))
    (isearch-mode t)
    (isearch-yank-string (buffer-substring-no-properties $p1 $p2))))


;;(pending-delete-mode +1)

;; setup the calendar before loading its customize variables
(copy-face font-lock-constant-face 'calendar-iso-week-face)
(set-face-attribute 'calendar-iso-week-face nil :height 1.0 :foreground "salmon")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation or beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line] 'smarter-move-beginning-of-line)

;;(if (< (length command-line-args) 2)
;;  (helm-recentf))

(use-package gcalcli-mode
  :straight (gcalcli-mode :type git :host github :repo "gizmomogwai/gcalcli-mode"))

(provide 'init)

;;(use-package avy
;;  :ensure t)
;;(use-package zzz-to-char
;;  :ensure t
;;  :after (avy)
;;  :config (global-set-key (kbd "M-z") #'zzz-to-char))
;;
;;(use-package rust-mode
;;  :ensure t
;;  :mode "\\.rs\\'"
;;  :init (setq rust-format-on-save t))
;;
;;(use-package eglot
;;  :ensure t
;;  :init (add-hook 'rust-mode-hook 'eglot-ensure))
;;
;;(defun my-before-switch-project-hook ()
;;  "Perform some action after switching Projectile projects."
;;  (message "Before switching project...")
;;  ;; Do something interesting here...
;;  ;;
;;  ;; `projectile-current-project-files', and `projectile-current-project-dirs' can be used
;;  ;; to get access to the new project's files, and directories.
;;  )
;;(defun my-after-switch-project-hook ()
;;  "Perform some action after switching Projectile projects."
;;  (message "Switched project to %s" (projectile-project-root)))
;;
;;(add-hook 'projectile-before-switch-project-hook #'my-before-switch-project-hook)
;;(add-hook 'projectile-after-switch-project-hook #'my-after-switch-project-hook)

(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages
    '(
       (ruby . t)
       (plantuml . t))))

(defun reload-init ()
  "Reload init.el."
  (interactive)
  (straight-transaction
    (straight-mark-transaction-as-init)
    (message "Reloading init.el...")
    (load user-init-file nil 'nomessage)
    (message "Reloading init.el... done.")))

;; https://stackoverflow.com/a/20788581
(require 'ansi-color)
(add-hook 'compilation-filter-hook
  (lambda() (when (eq major-mode 'compilation-mode)
              (ansi-color-apply-on-region compilation-filter-start (point-max)))))

;;; init.el ends here

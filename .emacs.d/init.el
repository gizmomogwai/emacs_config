;;; init.el --- My emacs init script
;;; Commentary:
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
(add-to-list 'initial-frame-alist '(font . "Fira Code Retina-15"))
(add-to-list 'default-frame-alist '(font . "Fira Code Retina-15"))
(toggle-frame-maximized)
(setq-default header-line-format '(:eval (which-function)))


(straight-use-package 'use-package)

(use-package magit
  :straight t)

(use-package zenburn-theme
  :straight t
  :config (load-theme 'zenburn t))

(use-package whole-line-or-region
  :straight t
  :config (whole-line-or-region-global-mode))

(use-package org-kanban
  :straight t)
(use-package editorconfig
  :straight t
  :config (editorconfig-mode 1))

(use-package minions
  :straight t
  :config (minions-mode 1))

(use-package key-chord
  :straight t
  :config
  (key-chord-define-global "FF" 'helm-find-files)
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
  :straight t)

(use-package char-menu
  :straight t)

(use-package undo-tree
  :straight t)

(use-package projectile
  :straight t
  :config (projectile-mode 1))

(use-package company
  :straight t
  :config (global-company-mode 1))

(use-package exec-path-from-shell
  :straight t
  :config (exec-path-from-shell-initialize))

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

(use-package multiple-cursors
  :straight t
  :config
  (global-set-key (kbd "M-n") 'mc/mark-next-like-this)
  (global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
  (global-set-key (kbd "M-a") 'mc/mark-all-like-this))

(use-package magit-org-todos
  :straight t
  :config (magit-org-todos-autoinsert))

(use-package plantuml-mode
  :straight t
  :config (plantuml-set-output-type "utxt"))

(use-package json-mode
  :straight t)

(use-package git-timemachine
  :straight t)

(use-package diff-hl
  :straight t
  :config (global-diff-hl-mode 1))

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

(if (< (length command-line-args) 2)
  (helm-recentf))

(provide 'init)

;;; init.el ends here

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


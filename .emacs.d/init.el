;;; init.el --- My emacs init script
;;; Commentary:
;;; Code:

(message "Running init.el")

(require 'package)
(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'initial-frame-alist '(font . "Fira Code Retina-15"))
(add-to-list 'default-frame-alist '(font . "Fira Code Retina-15"))

(toggle-frame-maximized)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package magit
  :defer 5
  :ensure t)
(use-package avy
  :ensure t)
(use-package zzz-to-char
  :ensure t
  :after (avy)
  :config (global-set-key (kbd "M-z") #'zzz-to-char))

(use-package whole-line-or-region
  :ensure t
  :config (whole-line-or-region-global-mode))

(use-package minions
  :ensure t
  :config (minions-mode 1))

(use-package char-menu
  :ensure t)

(use-package key-chord
  :ensure t
  :init (progn
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
          (key-chord-mode 1)))

(use-package helm
  :ensure t)

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(use-package editorconfig
  :ensure t
  :config (editorconfig-mode 1))

(use-package company
  :ensure t
  :config (global-company-mode))

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode 1)
  :after (exec-path-from-shell))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :init (setq rust-format-on-save t))

(use-package eglot
  :ensure t
  :init (add-hook 'rust-mode-hook 'eglot-ensure))

(use-package undo-tree
  :ensure t)

(use-package projectile
  :ensure t
  :config (projectile-mode +1))

(defun my-before-switch-project-hook ()
  "Perform some action after switching Projectile projects."
  (message "Before switching project...")
  ;; Do something interesting here...
  ;;
  ;; `projectile-current-project-files', and `projectile-current-project-dirs' can be used
  ;; to get access to the new project's files, and directories.
  )
(defun my-after-switch-project-hook ()
  "Perform some action after switching Projectile projects."
  (message "Switched project to %s" (projectile-project-root)))

(add-hook 'projectile-before-switch-project-hook #'my-before-switch-project-hook)
(add-hook 'projectile-after-switch-project-hook #'my-after-switch-project-hook)

(use-package helm-ag
  :ensure t
  :config (global-set-key (kbd "M-s") 'helm-ag-project-root))

(use-package expand-region
  :ensure t
  :config (global-set-key (kbd "C-M-w") 'er/expand-region))

(use-package org
  :ensure t)

(use-package autorevert
  :ensure t
  :config (global-auto-revert-mode))

(use-package magit-org-todos
  :defer 5
  :ensure t
  :config (magit-org-todos-autoinsert))

(use-package plantuml-mode
  :defer 5
  :ensure t
  :config (plantuml-set-output-type "utxt"))

(use-package json-mode
  :defer 5
  :ensure t)

(use-package git-timemachine
  :defer 10
  :ensure t)

(use-package diff-hl
  :defer 5
  :ensure t
  :config (global-diff-hl-mode 1))

(use-package ecukes
  :defer 10
  :ensure t)

(use-package sublimity
  :ensure t
  :config
  (require 'sublimity)
  (require 'sublimity-map)
  (sublimity-map-set-delay 0)
  (sublimity-mode 1)
  )

(use-package aggressive-indent
  :ensure t
  :config (global-aggressive-indent-mode 1))

(use-package org-htmlslidy
  :ensure t)
(use-package ztree
  :ensure t)

(use-package clipmon
  :ensure t
  :config (clipmon-mode-start))

(setq-default header-line-format '(:eval (which-function)))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(if (< (length command-line-args) 2 )
    (helm-recentf))

(provide 'init)
;;; init.el ends here

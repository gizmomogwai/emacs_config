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
  :ensure t)

(use-package key-chord
  :ensure t
  :init (progn
	  (key-chord-define-global "FF" 'helm-find-files)
	  (key-chord-define-global "uu" 'undo-tree-visualize)
	  (key-chord-define-global "xx" 'helm-M-x)
	  (key-chord-define-global "BB" 'beginning-of-buffer)
	  (key-chord-define-global "BE" 'end-of-buffer)
	  (key-chord-define-global "br" 'kill-buffer)
	  (key-chord-define-global "gs" 'magit-status)
	  (key-chord-define-global "GG" 'goto-line)
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
  :config (global-flycheck-mode)
  :after 'exec-path-from-shell)

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
  :config (projectile-mode))

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
  :ensure t
  :config
  (magit-org-todos-autoinsert))

(setq custom-file "~/.custom.el")
(load custom-file)
(if (< (length command-line-args) 2 )
       (helm-recentf))

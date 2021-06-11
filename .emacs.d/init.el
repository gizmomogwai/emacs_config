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

(use-package project
  :straight t)

;;(use-package org-mode
;;  :straight t)
;;  :config (progn
;;            (defalias 'D-mode 'd-mode)
;;            (require 'ob-C)))

(use-package magit
  :straight t)

(use-package git-timemachine
  :straight t)

(use-package zenburn-theme
  :straight t
  :config (load-theme 'zenburn t))

(use-package whole-line-or-region
  :straight t
  :config (whole-line-or-region-global-mode))

(use-package tff
  :straight (tff :type git :host github :repo "gizmomogwai/tff")
  :config (global-set-key (kbd "C-1") 'tff))

;;(use-package org-kanban
;;:straight t)

                                        ;(use-package magit-org-todos
;  :straight t
;  :config (magit-org-todos-autoinsert))

(use-package editorconfig
  :straight t
  :config (editorconfig-mode 1))

(use-package minions
  :straight t
  :config (minions-mode 1))

(use-package helpful
  :straight t)

;;(use-package docker
;;  :straight t)
;;(use-package dockerfile-mode
;;  :straight t)
(use-package key-chord
  :straight t
  :config
  (key-chord-define-global "FF" 'helm-projectile)
  (key-chord-define-global "uu" 'undo-tree-visualize)
  (key-chord-define-global "xx" 'helm-M-x)
  (key-chord-define-global "BB" 'beginning-of-buffer)
  (key-chord-define-global "BE" 'end-of-buffer)
  (key-chord-define-global "bb" 'helm-mini)
  (key-chord-define-global "BR" 'kill-buffer)
  (key-chord-define-global "bw" 'save-buffer)
  (key-chord-define-global "GS" 'magit-status)
  (key-chord-define-global "GG" 'goto-line)
  (key-chord-define-global "yy" 'helm-show-kill-ring)
  (key-chord-define-global "PP" 'hydra-projectile/body)
  (key-chord-define-global "TT" 'tff)
  (key-chord-mode 1))

(use-package hydra
  :straight t
  :config
  (defhydra hydra-projectile (:columns 4)
    "
Project %(projectile-project-root) "
    ("b" projectile-compile-project "Build")
    ("c" projectile-invalidate-cache "Clear Cache")
    ("f" projectile-find-file "Find File")
    ("g" deadgrep "Ripgrep")
    ("i" projectile-project-info "Info")
    ("k" projectile-kill-buffers "Kill Buffers")
    ("l" projectile-layout-project "Layout")
    ("o" projectile-multi-occur "Multi Occur")
    ("q" nil "Cancel" color: blue)
    ("r" projectile-run-project "Run")
    ("s" magit-status "Magit")
    ("t" projectile-test-project "Test")
    ))

(defun projectile-layout-project ()
  "Format a project."
  (interactive)
  (message "%s" (projectile-project-type))
  (pcase (projectile-project-type)
    ('dmd (shell-command "find . -name \"*.d\" | xargs dub run dfmt -- -i"))))

(use-package helm
  :straight t
  :config
    (helm-mode +1)
    (global-set-key (kbd "C-x C-f") #'helm-find-files)
    (global-set-key (kbd "M-x") #'helm-M-x))

(use-package char-menu
  :straight t)

(use-package undo-tree
  :straight t)

(use-package projectile
  :straight t
  :config (projectile-mode 1)
  (projectile-register-project-type
    'dmd
    '("dub.sdl")
    :compile "source ~/dlang/dmd-2.091.0/activate.fish && dub build"
    :test "source ~/dlang/dmd-2.091.0/activate.fish && dub test"
    :run "source ~/dlang/dmd-2.091.0/activate.fish && dub build && dub run dscanner -- --styleCheck . || true && dub run -- . .. ../.."
  ))

;;(use-package projectile-rails
;;  :straight t
;;  :config (projectile-rails-global-mode 1))

(use-package helm-projectile
  :straight t)

(use-package protobuf-mode
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

;;(use-package helm-ag
;;  :straight t
;;  :config (global-set-key (kbd "M-s") 'helm-ag-project-root))

(use-package expand-region
  :straight t
  :config (global-set-key (kbd "C-M-w") 'er/expand-region))


;;(use-package org-roam
;;      :after org
;;      :hook
;;      ((org-mode . org-roam-mode)
;;       (after-init . org-roam--build-cache-async) ;; optional!
;;       )
;;      :straight (:host github :repo "jethrokuan/org-roam" :branch "develop")
;;      :custom
;;  (org-roam-directory "~/Dropbox/org/roam/")
;;  (org-roam-graph-viewer "/usr/bin/open")
;;      :bind
;;      ("C-c n l" . org-roam)
;;      ("C-c n t" . org-roam-today)
;;      ("C-c n f" . org-roam-find-file)
;;      ("C-c n i" . org-roam-insert)
;;      ("C-c n g" . org-roam-show-graph))

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
(use-package yafolding
  :straight (yafolding :type git :host github :repo "vindarel/yafolding.el")
  :config (progn
            (defhydra yafolding-hydra (:color blue :columns 3)
              "Fold code based on indentation levels."
              ("t" yafolding-toggle-element "toggle element")
              ("s" yafolding-show-element "show element")
              ("h" yafolding-hide-element "hide element")
              ("T" yafolding-toggle-all "toggle all")
              ("S" yafolding-show-all "show all")
              ("H" yafolding-hide-all "hide all")
              ("p" yafolding-hide-parent-element "hide parent element")
              ("i" yafolding-get-indent-level "get indent level")
              ("g" yafolding-go-parent-element "go parent element"))
            (global-set-key (kbd "C-c f") 'yafolding-hydra/body)))


;;(use-package emmet-mode
;;  :straight t
;;  :config
;;  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;;  (add-hook 'css-mode-hook 'emmet-mode))

(use-package org-pomodoro
  :straight t)

(use-package plantuml-mode
  :straight t
  :config (plantuml-set-output-type "png"))

(use-package graphviz-dot-mode
  :straight t)

(use-package htmlize
  :straight t)

(use-package groovy-mode
  :straight t
  :config (add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode)))
;;(use-package lua-mode
;;  :straight t)

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

;;(use-package aggressive-indent
;;  :straight t
;;  :config (global-aggressive-indent-mode 1))

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

(use-package wgrep
  :straight t)

(use-package elgrep
  :straight t)

(use-package noccur
  :straight t)

(use-package counsel
  :straight t)

;; uses magit-popup
;;(use-package swiper-helm
  ;; :straight t)

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

(use-package docker
  :straight t
  :bind ("C-c d" . docker))

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
  :straight (gcalcli-mode :type git :host github :repo "gizmomogwai/gcalcli-mode")
  :config (progn
            (setq gcalcli-mode-client-id "230398451995-h0f4frjhg6p1jcg4ivfg9rl1t2gl0c1o.apps.googleusercontent.com")
            (setq gcalcli-mode-client-secret "UV-X38HVhjkkBIuUJJhoEtqh")))

(use-package sdcv-mode
  :straight (sdcv-mode :type git :host github :repo "gucong/emacs-sdcv")
  :config (setq sdcv-dictionary-path "~/.stardict"))

(use-package named-timer
  :straight t)

(provide 'init)

;;(use-package avy
;;  :ensure t)
;;(use-package zzz-to-char
;;  :ensure t
;;  :after (avy)
;;  :config (global-set-key (kbd "M-z") #'zzz-to-char))
;;

;;(use-package rust-mode
;;  :straight t)
;;  :mode "\\.rs\\'"
;;  :init (setq rust-format-on-save t))

(c-add-style "my-d-mode"
  '("cc-mode"
     (c-basic-offset . 4)
     (c-offsets-alist
       (arglist-intro . +)
       (arglist-close . 0)
       (substatement-open . 0)
       (statement-cont . +)
       (inline-open . 0)
       (label . +)
       )))

(defun my-d-mode-setup ()
  "Setup indent according to dfmt's defaults."
  (interactive)
  (message "setting up d-mode indents")
  (c-set-style "my-d-mode")
  (setq show-trailing-whitespace t)
  )


(use-package d-mode
  :straight t
  :config (add-hook 'd-mode-hook 'my-d-mode-setup))

;;(use-package eglot
;;  :straight t
;;  :init (progn
;;          (add-hook 'd-mode-hook 'eglot-ensure)
;;          ))
;;(add-to-list
;;  'eglot-server-programs
;;  '(d-mode . ("/Users/christiankoestlin/bin/serve-d")))

(use-package lib-requires
  :straight t)
(libreq-requires-tree 'project)
(libreq-requires-tree 'cl-generic)
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

(defun org-link-mark-file-and-line ()
  "Copy current file and line to org-link."
  (interactive)
  (setq org-link--file (buffer-file-name))
  (setq org-link--line (line-number-at-pos)))

(defun org-link-paste (link-text)
  "Paste a link to the last mark as LINK-TEXT."
  (interactive (list (read-string
                       (format "Linktext (%s): " (format "%s:%s" org-link--file org-link--line))
                       nil
                       nil
                       (format "%s:%s" org-link--file org-link--line))))
  (insert (format "[[%s::%s][%s]]" (file-relative-name org-link--file (file-name-directory (buffer-file-name))) org-link--line link-text)))

(use-package epa-file
  :ensure nil ;; included with Emacs
  :config (setq epa-file-encrypt-to '("christian.koestlin@gmail.com"))
  :custom (epa-file-select-keys 'silent))


;;(defun jump-to-org-agenda ()
;;  "Open my org agenda."
;;  (interactive)
;;  (let (
;;         (buffer (get-buffer "*Org Agenda*"))
;;         window)
;;    (if buffer
;;        (if (setq window (get-buffer-window buffer))
;;            (select-window window)
;;          (if (called-interactively-p 'any)
;;              (progn
;;                (select-window (display-buffer buffer t t))
;;                (org-fit-window-to-buffer)
;;                )
;;            (with-selected-window (display-buffer buffer)
;;              (org-fit-window-to-buffer)
;;              )))
;;      (call-interactively 'org-agenda-list)))
;;  )
;;
;;(named-timer-run :harass-myself
;;  t
;;  20
;;  (lambda()
;;    (when (< (org-user-idle-seconds) 20)
;;      (if (and
;;            (not (org-clocking-p))
;;            (not (-contains-p '(:short-break :long-break) org-pomodoro-state)))
;;        (progn
;;          (message "Hey! you should be clocked into something.")
;;          (run-with-idle-timer 300 t 'jump-to-org-agenda))
;;        ))))
;;      ;(ns/org-check-casual-time-today t)

(toggle-frame-maximized)
;;; init.el ends here

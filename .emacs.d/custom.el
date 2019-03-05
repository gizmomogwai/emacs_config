(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d.autosave/" t))))
 '(auto-save-list-file-prefix "~/.emacs.d.autosave/")
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d.backup/"))))
 '(c-offsets-alist (quote ((substatement-open . 0))))
 '(calendar-date-style (quote iso))
 '(calendar-intermonth-header "KW")
  '(calendar-intermonth-text
     (quote
       (propertize
         (format "%2d"
           (car
             (calendar-iso-from-absolute
               (calendar-absolute-from-gregorian
                 (list month day year)))))
         (quote font-lock-face)
         (quote calendar-iso-week-face))))
 '(calendar-today-marker (quote calendar-today))
 '(calendar-today-visible-hook (quote (calendar-mark-today)))
  '(char-menu
     (quote
       ("—" "‘’" "“”" "…" "«»" "–"
         ("Typography" "•" "©" "†" "‡" "°" "·" "§" "№" "★")
         ("Math" "≈" "≡" "≠" "∞" "×" "±" "∓" "÷" "√")
         ("Arrows" "←" "→" "↑" "↓" "⇐" "⇒" "⇑" "⇓")
         ("Greek" "α" "β" "Y" "δ" "ε" "ζ" "η" "θ" "ι" "κ" "λ" "μ" "ν" "ξ" "ο" "π" "ρ" "σ" "τ" "υ" "φ" "χ" "ψ" "ω"))))
 '(company-dabbrev-downcase nil)
  '(company-frontends
     (quote
       (company-pseudo-tooltip-unless-just-one-frontend company-preview-frontend company-echo-metadata-frontend)))
 '(company-minimum-prefix-length 2)
 '(compilation-scroll-output (quote first-error))
 '(confirm-nonexistent-file-or-buffer nil)
 '(custom-enabled-themes (quote (zenburn)))
  '(custom-safe-themes
     (quote
       ("420459d6eeb45aadf5db5fbcc3d6990b65141c104911f7359454fc29fa9d87a0" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" default)))
 '(debug-on-error nil)
 '(delete-old-versions t)
  '(editorconfig-indentation-alist
     (quote
       ((apache-mode apache-indent-level)
         (awk-mode c-basic-offset)
         (c++-mode c-basic-offset)
         (d-mode c-basic-offset)
         (c-mode c-basic-offset)
         (cmake-mode cmake-tab-width)
         (coffee-mode coffee-tab-width)
         (cperl-mode cperl-indent-level)
         (crystal-mode crystal-indent-level)
         (csharp-mode c-basic-offset)
         (css-mode css-indent-offset)
         (emacs-lisp-mode lisp-indent-offset)
         (erlang-mode erlang-indent-level)
         (ess-mode ess-indent-offset)
         (feature-mode feature-indent-offset feature-indent-level)
         (fsharp-mode fsharp-continuation-offset fsharp-indent-level fsharp-indent-offset)
         (groovy-mode groovy-indent-offset)
         (haskell-mode haskell-indent-spaces haskell-indent-offset haskell-indentation-layout-offset haskell-indentation-left-offset haskell-indentation-starter-offset haskell-indentation-where-post-offset haskell-indentation-where-pre-offset shm-indent-spaces)
         (idl-mode c-basic-offset)
         (jade-mode jade-tab-width)
         (java-mode c-basic-offset)
         (js-mode js-indent-level)
         (js-jsx-mode js-indent-level sgml-basic-offset)
         (js2-mode js2-basic-offset)
         (js2-jsx-mode js2-basic-offset sgml-basic-offset)
         (js3-mode js3-indent-level)
         (json-mode js-indent-level)
         (julia-mode julia-indent-offset)
         (latex-mode . editorconfig-set-indentation/latex-mode)
         (lisp-mode lisp-indent-offset)
         (livescript-mode livescript-tab-width)
         (lua-mode lua-indent-level)
         (matlab-mode matlab-indent-level)
         (mustache-mode mustache-basic-offset)
         (nginx-mode nginx-indent-level)
         (nxml-mode nxml-child-indent
           (nxml-attribute-indent . 2))
         (objc-mode c-basic-offset)
         (octave-mode octave-block-offset)
         (perl-mode perl-indent-level)
         (php-mode c-basic-offset)
         (pike-mode c-basic-offset)
         (ps-mode ps-mode-tab)
         (pug-mode pug-tab-width)
         (puppet-mode puppet-indent-level)
         (python-mode . editorconfig-set-indentation/python-mode)
         (ruby-mode ruby-indent-level)
         (rust-mode rust-indent-offset)
         (scala-mode scala-indent:step)
         (scss-mode css-indent-offset)
         (sgml-mode sgml-basic-offset)
         (sh-mode sh-basic-offset sh-indentation)
         (slim-mode slim-indent-offset)
         (tcl-mode tcl-indent-level tcl-continued-indent-level)
         (typescript-mode typescript-indent-level)
         (verilog-mode verilog-indent-level verilog-indent-level-behavioral verilog-indent-level-declaration verilog-indent-level-module verilog-cexp-indent verilog-case-indent)
         (web-mode
           (web-mode-indent-style lambda
             (size)
             2)
           web-mode-attr-indent-offset web-mode-attr-value-indent-offset web-mode-code-indent-offset web-mode-css-indent-offset web-mode-markup-indent-offset web-mode-sql-indent-offset web-mode-block-padding web-mode-script-padding web-mode-style-padding)
         (yaml-mode yaml-indent-offset))))
  '(exec-path
     (quote
       ("/Users/gizmo/.cargo/bin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_10" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_10" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin")))
 '(gcal-mode-calendar (quote christian\.koestlin))
 '(gcal-mode-days-after 3)
 '(gcalcli-mode-calendar "christian.koestlin")
 '(gcalcli-mode-days-to-show 3)
 '(global-display-line-numbers-mode t)
 '(global-whitespace-mode t)
 '(helm-mode-fuzzy-match t)
 '(inhibit-startup-screen t)
 '(kill-whole-line t)
 '(lsp-rust-rls-command (quote ("/Users/gizmo/.cargo/bin/rls")))
 '(markdown-command "pandoc")
 '(menu-bar-mode nil)
 '(ns-alternate-modifier (quote none))
 '(ns-antialias-text t)
 '(ns-auto-hide-menu-bar t)
 '(ns-command-modifier (quote meta))
 '(org-agenda-files (quote ("~/Dropbox/org/")))
 '(org-closed-keep-when-no-todo t)
 '(org-confirm-babel-evaluate nil)
 '(org-log-done (quote note))
 '(org-plantuml-jar-path "~/bin/plantuml.1.2018.13.jar")
  '(package-selected-packages
     (quote
       (clipmon char-menu typit typeit zzz-to-char ztree aggressive-indent org-htmlslidy minions whole-line-or-region hydra sublimity ecukes diff-hl git-timemachine json-mode plantuml-mode magit-org-todos key-chord expand-region helm-ag projectile exec-path-from-shell eglot undo-tree color-theme-zenburn lsp-ui-flycheck lsp-flycheck flycheck company editorconfig zenburn-theme helm magit use-package)))
 '(plantuml-jar-path "/Users/gizmo/bin/plantuml.1.2018.7.jar")
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-indexing-method (quote hybrid))
 '(projectile-require-project-root nil)
 '(recenter-positions (quote (top middle bottom)))
 '(rg-custom-type-aliases nil)
 '(rg-group-result t)
 '(rg-show-columns t)
  '(safe-local-variable-values
     (quote
       ((eval org-columns)
         (eval goto-char
           (point-min))
         (checkdoc-package-keywords-flag)
         (eval progn
           (c-set-offset
             (quote arglist-intro)
             (quote 2))
           (c-set-offset
             (quote arglist-close)
             (quote 0)))
         (org-duration-format . h:mm)
         (org-tags-column . 120)
         (org-tags-column . 100)
         (org-tags-column . 140)
         (org-tags-column . 90)
         (org-log-done))))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-preserve-screen-position t)
 '(tool-bar-mode nil)
 '(version-control t)
 '(view-read-only t)
 '(whitespace-style (quote (trailing tabs spaces indentation::space tab-mark)))
 '(x-stretch-cursor t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(calendar-iso-week-face ((t (:foreground "gray40"))) t)
  '(calendar-today ((t (:inverse-video t))))
  '(whitespace-hspace ((t nil)))
  '(whitespace-space ((t nil))))

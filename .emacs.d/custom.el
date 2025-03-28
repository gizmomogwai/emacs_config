(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-gpg-encrypt-to '("0456097ED35EBC82D36509A3C274FCF2D48F6953"))
 '(auth-sources '((:source "~/.gcalcli.gpg")))
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d.autosave/\\1" t)))
 '(auto-save-list-file-prefix "~/.emacs.d.autosave/")
 '(backup-directory-alist '((".*" . "~/.emacs.d.backup/")))
 '(c-offsets-alist '((substatement-open . +)))
 '(calendar-date-style 'iso)
 '(calendar-intermonth-header "KW")
 '(calendar-intermonth-text
    '(propertize
       (format "%2d"
         (car
           (calendar-iso-from-absolute
             (calendar-absolute-from-gregorian (list month day year)))))
       'font-lock-face 'calendar-iso-week-face))
 '(calendar-today-marker 'calendar-today)
 '(calendar-today-visible-hook '(calendar-mark-today))
 '(char-menu
    '("—" "‘’" "“”" "…" "«»" "–"
       ("Typography" "•" "©" "†" "‡" "°" "·" "§" "№" "★")
       ("Math" "≈" "≡" "≠" "∞" "×" "±" "∓" "÷" "√")
       ("Arrows" "←" "→" "↑" "↓" "⇐" "⇒" "⇑" "⇓")
       ("Greek" "α" "β" "Y" "δ" "ε" "ζ" "η" "θ" "ι" "κ" "λ" "μ" "ν"
         "ξ" "ο" "π" "ρ" "σ" "τ" "υ" "φ" "χ" "ψ" "ω")))
 '(codeium/metadata/api_key "cd347ab3-f7f6-4ea6-bc94-3c8a523e16eb")
 '(company-dabbrev-downcase nil)
 '(company-frontends
    '(company-pseudo-tooltip-unless-just-one-frontend
       company-preview-frontend company-echo-metadata-frontend))
 '(company-minimum-prefix-length 2)
 '(compilation-always-kill t)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-error-regexp-alist
    '(d-scanner d-exceptions dmd-continuation dmd-deprecation dmd-warning
       dmd-error absoft ada aix ant bash borland
       python-tracebacks-and-caml cmake cmake-info comma msft edg-1
       edg-2 epc ftnchek gradle-kotlin iar ibm irix java javac
       jikes-file maven jikes-line clang-include gcc-include
       ruby-Test::Unit gmake gnu cucumber lcc makepp mips-1 mips-2
       omake oracle perl php rxp shellcheck sparc-pascal-file
       sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd
       gcov-file gcov-header gcov-nomark gcov-called-line
       gcov-never-called perl--Pod::Checker perl--Test perl--Test2
       perl--Test::Harness weblint guile-file guile-line))
 '(compilation-scroll-output 'first-error)
 '(confirm-nonexistent-file-or-buffer nil)
 '(create-lockfiles nil)
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
    '("420459d6eeb45aadf5db5fbcc3d6990b65141c104911f7359454fc29fa9d87a0"
       "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df"
       default))
 '(deadgrep-executable "/opt/homebrew/bin/rg")
 '(debug-on-error nil)
 '(delete-old-versions t)
 '(dired-use-ls-dired nil)
 '(editorconfig-indentation-alist
    '((apache-mode apache-indent-level) (awk-mode c-basic-offset)
       (c++-mode c-basic-offset) (d-mode c-basic-offset)
       (c-mode c-basic-offset) (cmake-mode cmake-tab-width)
       (coffee-mode coffee-tab-width) (cperl-mode cperl-indent-level)
       (crystal-mode crystal-indent-level)
       (csharp-mode c-basic-offset) (css-mode css-indent-offset)
       (emacs-lisp-mode lisp-indent-offset)
       (erlang-mode erlang-indent-level) (ess-mode ess-indent-offset)
       (feature-mode feature-indent-offset feature-indent-level)
       (fsharp-mode fsharp-continuation-offset fsharp-indent-level
         fsharp-indent-offset)
       (groovy-mode groovy-indent-offset)
       (haskell-mode haskell-indent-spaces haskell-indent-offset
         haskell-indentation-layout-offset
         haskell-indentation-left-offset
         haskell-indentation-starter-offset
         haskell-indentation-where-post-offset
         haskell-indentation-where-pre-offset shm-indent-spaces)
       (idl-mode c-basic-offset) (jade-mode jade-tab-width)
       (java-mode c-basic-offset) (js-mode js-indent-level)
       (js-jsx-mode js-indent-level sgml-basic-offset)
       (js2-mode js2-basic-offset)
       (js2-jsx-mode js2-basic-offset sgml-basic-offset)
       (js3-mode js3-indent-level) (json-mode js-indent-level)
       (julia-mode julia-indent-offset)
       (latex-mode . editorconfig-set-indentation/latex-mode)
       (lisp-mode lisp-indent-offset)
       (livescript-mode livescript-tab-width)
       (lua-mode lua-indent-level) (matlab-mode matlab-indent-level)
       (mustache-mode mustache-basic-offset)
       (nginx-mode nginx-indent-level)
       (nxml-mode nxml-child-indent (nxml-attribute-indent . 2))
       (objc-mode c-basic-offset) (octave-mode octave-block-offset)
       (perl-mode perl-indent-level) (php-mode c-basic-offset)
       (pike-mode c-basic-offset) (ps-mode ps-mode-tab)
       (pug-mode pug-tab-width) (puppet-mode puppet-indent-level)
       (python-mode . editorconfig-set-indentation/python-mode)
       (ruby-mode ruby-indent-level) (rust-mode rust-indent-offset)
       (scala-mode scala-indent:step) (scss-mode css-indent-offset)
       (sgml-mode sgml-basic-offset)
       (sh-mode sh-basic-offset sh-indentation)
       (slim-mode slim-indent-offset)
       (tcl-mode tcl-indent-level tcl-continued-indent-level)
       (typescript-mode typescript-indent-level)
       (verilog-mode verilog-indent-level
         verilog-indent-level-behavioral
         verilog-indent-level-declaration verilog-indent-level-module
         verilog-cexp-indent verilog-case-indent)
       (web-mode (web-mode-indent-style lambda (size) 2)
         web-mode-attr-indent-offset web-mode-attr-value-indent-offset
         web-mode-code-indent-offset web-mode-css-indent-offset
         web-mode-markup-indent-offset web-mode-sql-indent-offset
         web-mode-block-padding web-mode-script-padding
         web-mode-style-padding)
       (yaml-mode yaml-indent-offset)))
 '(emmet-indentation 2)
 '(exec-path
    '("/opt/homebrew/bin"
       "/Users/christiankoestlin/dlang/dmd-2.100.0/osx/bin"
       "/Users/chrisitankoestlin/.cargo/bin" "/opt/homebrew/bin/dot"
       "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin"
       "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_10"
       "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_10"
       "/Applications/Emacs.app/Contents/MacOS/libexec"
       "/Applications/Emacs.app/Contents/MacOS/bin"))
 '(flycheck-disabled-checkers '(d-dmd))
 '(flycheck-vale-program "/usr/local/bin/vale")
 '(gcal-mode-calendar 'christian.koestlin)
 '(gcal-mode-days-after 3)
 '(gcalcli-mode-calendar "christian.koestlin")
 '(gcalcli-mode-days-to-show 3)
 '(global-display-line-numbers-mode t)
 '(global-jinx-mode t)
 '(global-whitespace-mode t)
 '(graphviz-dot-dot-program "/opt/homebrew/bin/dot")
 '(helm-mode-fuzzy-match t)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries 'left)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(ispell-dictionary "english")
 '(jinx-languages "en_US de_DE")
 '(kill-whole-line t)
 '(lsp-rust-rls-command '("/Users/gizmo/.cargo/bin/rls"))
 '(magit-diff-refine-hunk 'all)
 '(make-backup-files nil)
 '(markdown-command "pandoc")
 '(menu-bar-mode t)
 '(ns-alternate-modifier 'none)
 '(ns-antialias-text t)
 '(ns-auto-hide-menu-bar nil)
 '(ns-command-modifier 'meta)
 '(org-agenda-files '("~/Sync/projects/_org/2024-esr.org"))
 '(org-babel-D-compiler "~/dlang/dmd-2.100.0/osx/bin/dub")
 '(org-babel-D-dub "~/dlang/dmd-2.100.0/osx/bin/dub")
 '(org-babel-D-rdmd "~/dlang/dmd-2.100.0/osx/bin/rdmd")
 '(org-closed-keep-when-no-todo t)
 '(org-confirm-babel-evaluate nil)
 '(org-export-timestamp-file nil)
 '(org-file-apps
   '(
     (auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     ("\\.md" . emacs)
     (directory . emacs)
     ))
 '(org-log-done 'note)
 '(org-plantuml-jar-path "~/bin/plantuml.jar")
 '(org-pomodoro-length 20)
 '(org-roam-autopopulate-title nil)
 '(org-roam-directory "~/Dropbox/org/roam/")
 '(org-roam-graph-viewer /usr/bin/open)
 '(org-roam-link-title-format "%s")
 '(package-selected-packages
    '(clipmon char-menu typit typeit zzz-to-char ztree aggressive-indent
       org-htmlslidy minions whole-line-or-region hydra sublimity
       ecukes diff-hl git-timemachine json-mode plantuml-mode
       magit-org-todos key-chord expand-region helm-ag projectile
       exec-path-from-shell eglot undo-tree color-theme-zenburn
       lsp-ui-flycheck lsp-flycheck flycheck company editorconfig
       zenburn-theme helm magit use-package))
 '(plantuml-default-exec-mode 'jar)
 '(plantuml-jar-path "~/bin/plantuml.jar")
 '(projectile-cache-file "~/tmp/projectile.cache")
 '(projectile-completion-system 'helm)
 '(projectile-enable-caching t)
 '(projectile-indexing-method 'native)
 '(projectile-project-root-files
    '("rebar.config" "project.clj" "build.boot" "deps.edn" "SConstruct"
       "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime"
       "Gemfile" "requirements.txt" "setup.py" "pyproject.toml"
       "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml"
       "info.rkt" "DESCRIPTION" "TAGS" "GTAGS" "configure.in"
       "configure.ac" "cscope.out" ".projectile" ".git"))
 '(projectile-require-project-root t)
 '(read-file-name-completion-ignore-case t)
 '(recenter-positions '(top middle bottom))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 200)
 '(recentf-mode t)
 '(require-final-newline 'ask)
 '(rg-custom-type-aliases nil)
 '(rg-group-result t)
 '(rg-show-columns t)
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values
    '((fldd-dub-configuration . "unittest") (eval flycheck-cask-setup)
       (eval progn (goto-char (point-min)) (org-columns t))
       (org-link-file-path-type . relative)
       (projectile-project-compilation-cmd
         . "source ~/dlang/dmd-2.100.0/activate.fish && cat ~/Downloads/received.log | dub run")
       (projectile-project-compilation-cmd
         . "source ~/dlang/dmd-2.100.0/activate.fish && dub test --coverage -- -s -t -d")
       (eval org-columns) (eval goto-char (point-min))
       (checkdoc-package-keywords-flag)
       (eval progn (c-set-offset 'arglist-intro '2)
         (c-set-offset 'arglist-close '0))
       (org-duration-format . h:mm) (org-tags-column . 120)
       (org-tags-column . 100) (org-tags-column . 140)
       (org-tags-column . 90) (org-log-done)))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10000)
 '(scroll-preserve-screen-position t)
 '(sgml-basic-offset 4)
 '(show-trailing-whitespace t)
 '(tff/patterns-and-replacements
    '(("\\(.*?\\)\\.h" "\\1.cpp") ("\\(.*?\\)\\.cpp" "\\1.h")
       ("\\(.*?\\)src\\(.*?\\)\\.cpp" "\\1test\\2_test.cpp")
       ("\\(.*?\\)test\\(.*?\\)_test.cpp" "\\1src\\2.h")))
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree")))
 '(version-control t)
 '(view-read-only t)
 '(warning-suppress-log-types '((use-package)))
 '(whitespace-style '(trailing tabs spaces indentation::space tab-mark))
 '(x-stretch-cursor t)
 '(yas-snippet-dirs '("~/Sync/configs/emacs/.emacs.d/snippets/.")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-iso-week-face ((t (:foreground "gray40"))) t)
 '(calendar-today ((t (:inverse-video t))))
 '(whitespace-hspace ((t nil)))
 '(whitespace-space ((t nil))))

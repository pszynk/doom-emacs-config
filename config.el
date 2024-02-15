;;; config.el --- -*- lexical-binding: t -*-

;; email obfuscation
(defun @gmail (address) (concat address "@gmail.com"))

;; Place your private configuration here

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Paweł Szynkiewicz"
      user-mail-address "pszynk@gmail.com"
      calendar-date-style 'iso
      ;; Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs the utility of always keeping them on.
      display-line-numbers-type nil
      ;; More common use-case
      evil-ex-substitute-global t)

;; GPG
;;
;; ~/.config/emacs/.local/etc/authinfo.gpg
;; TODO add something like ~/.config/doom/.secrets/authinfo.gpg
;;      and move default /.authinfo.gpg
;; (set auth-sources '("/.authinfo.gpg")
;;      auth-source-cache-expiry 7200) ; default is 7200 (2h), nil for no expiry
(setq auth-source-cache-expiry nil)
(setq epa-pinentry-mode 'loopback)

;;
;;; UI

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; :family "FantasqueSansMono Nerd Font Mono"
;; :size 20
(setq doom-font
      (font-spec
       :family "JetBrainsMono Nerd Font"
       :size 18
       :weight 'normal))

;; we need some bigger fringes!
(when (functionp 'fringe-mode) (fringe-mode 12))



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-mbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;
;;; Packages

;;; Modules

;;; :completion
;;; *** counsel
;; https://github.com/hlissner/doom-emacs/issues/3038
(after! counsel
  (setq counsel-rg-base-command
        "rg -M 240 --with-filename --no-heading --line-number --color never \
--no-messages %s || true"))

;; ivy
;; +childframe
;; don't use childrame for those also
                                        ;(after! ivy
                                        ;  (when (featurep! :completion ivy +childframe)
                                        ;    (dolist (fn '(counsel-describe-function counsel-describe-variable))
                                        ;      (setf (alist-get fn ivy-posframe-display-functions-alist)
                                        ;            #'ivy-display-function-fallback))
                                        ;    )
                                        ;  )

;;; :editor

;;; :checkers
;;; +flyspell
(after! ispell
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "pl_PL,en_US"))

;;; :tools
;;; editor
(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
        sql-mode         ; sqlformat is currently broken
        tex-mode         ; latexindent is broken
        latex-mode
        go-mode))        ; too aggresive

;;; lsp

;;; magit
(setq magit-repository-directories '(("~/Projects" . 2))
      magit-save-repository-buffers nil
      ;; Don't restore the wconf after quitting magit, it's jarring
      magit-inhibit-save-previous-winconf t)
;;; forge
(with-eval-after-load 'forge
  (push '("glucyn.zisi.nask.pl"
          "glucyn.zisi.nask.pl/api/v4"
          "glucyn.zisi.nask.pl"
          forge-gitlab-repository) forge-alist)
  (push '("github.mit.edu"
          "github.mit.edu/api/v3"
          "github.mit.edu"
          forge-github-repository) forge-alist)
  )
;;; projectile
(after! projectile
  (setq projectile-ignored-projects '("~/" "/tmp")
        projectile-project-search-path
        (append '("~/Projects/code"
                  "~/Work/nask")
                (directory-files
                 "~/Projects/code/exercism"
                 t
                 directory-files-no-dot-files-regexp)))
  (pushnew! projectile-globally-ignored-directories ".nox" ".mypy_cache")

  )



;;; :lang
;;; org
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(setq org-directory "~/org/")
                                        ;(setq org-directory "~/.org/"
                                        ;      org-archive-location (concat org-directory ".archive/%s::")
                                        ;      org-roam-directory (concat org-directory "notes/")
                                        ;      org-roam-db-location (concat org-roam-directory ".org-roam.db")
                                        ;      ;;org-journal-encrypt-journal t ; TODO encript, what is journal?
                                        ;      org-journal-file-format "%Y%m%d.org"
                                        ;      org-startup-folded 'overview
                                        ;      org-ellipsis " [...] "
                                        ;      org-superstar-headline-bullets-list '("#"))

;;; +org-tree-slide-mode TODO simple profile: NO on startup?
;; (use-package! org-tree-slid
;;   :config
;;   (setq org-tree-slide-skip-outline-level 3
;;         +org-present-text-scale 2
;;         org-tree-slide-slide-in-effect t
;;         )
;;   )
;; (add-to-list 'org-src-lang-modes '("gotmpl" . web))
;; let Org-mode Babel src code block auto set `web-mode-engine' for rhtml.
;; (defadvice org-edit-special (before org-edit-src-code activate)
;;   (let ((lang (nth 0 (org-babel-get-src-block-info))))
;;     (if (string= lang "gotmpl")
;;         (web-mode-set-engine "go"))
;;     ))
;; (defun web-mode-set-engine-babel ()
;;   (let ((lang (nth 0 (org-babel-get-src-block-info))))
;;     (if (string= lang "gotmpl")
;;         (web-mode-set-engine "go"))
;;     ))

;; (advice-add 'org-edit-special :before #'web-mode-set-engine-babel)
;; (advice-add 'org-babel-tangle :before #'web-mode-set-engine-babel)



;; (setq
;;  org-babel-tangle-comment-format-beg "{{ asdasd [[%link][source-name]] }}"
;;  org-babel-tangle-comment-format-end "{{ %source-name ends here }}")
;;; +org-contacts
(setq my/org-contacts-main-file (concat org-directory "contacts.org"))

;; TODO make it lazy?
(use-package! org-contacts
  :defer t
  :config
  ;; (setq org-contacts-files (mapcar (lambda (x) (concat org-directory x)) '("contacts.org"))))
  (setq org-contacts-files (list my/org-contacts-main-file)))

(defvar my/org-contacts-template "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:PHONE:
:ADDRESS: %^{Marszałkowska 1, 01-001 Warszawa, Polska}
:BIRTHDAY: %^{yyyy-mm-dd}
:NOTE: %^{NOTE}
:ICON:
:IGNORE:
:END:" "Template for org-contacts.")

(setq org-capture-templates
      `(
        ("c" "Contact" entry (file+headline my/org-contacts-main-file "Friends"),
         my/org-contacts-template
         :empty-lines 1)
        )
      )

;;; python
(use-package! poetry
  :defer t
  :custom
  (poetry-tracking-strategy 'projectile))

;;; protobuf

(defconst +my-protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil))
  "google style for protbuf"
  )

(use-package! protobuf-mode
  :defer t
  :init
  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" +my-protobuf-style t))
            )
  )

;;; tramp
(after! tramp
  (add-to-list
   'tramp-methods
   '("gcssh"
     (tramp-login-program        "gcloud compute ssh")
     (tramp-login-args           (("%h")))
     (tramp-async-args           (("-q")))
     (tramp-remote-shell         "/bin/sh")
     (tramp-remote-shell-args    ("-c"))
     (tramp-gw-args              (("-o" "GlobalKnownHostsFile=/dev/null")
                                  ("-o" "UserKnownHostsFile=/dev/null")
                                  ("-o" "StrictHostKeyChecking=no")))
     (tramp-default-port         22)))
  )

;;; dap-mode (debugger)
(after! dap-mode
  (setq dap-python-debugger 'debugpy))

;;; lsp-mode
;; *.pyi in find references! No more!
(defun pszynk/xref-python-stub-p (item)
  "Return t if `item' is from a *.pyi stub."
  (string-suffix-p ".pyi" (oref (xref-item-location item) file)))

(defun pszynk/filter-not-python-stub-definitions (items)
  "Remove Python stubs from a list of xref-items."
  (cl-remove-if #'pszynk/xref-python-stub-p items))

;; add toggle on lsp-headerline-breadcrumb-mode
                                        ;(use-package! lsp-mode
                                        ;  :defer t
                                        ;  :custom
                                        ;  ;; Display all of the info returned by document/onHover. If this is nil, eldoc
                                        ;  ;; will show only the symbol information.
                                        ;  (lsp-eldoc-render-all t "More info on what the cursor is at") ;; maybe a bit much...
                                        ;  (lsp-headerline-breadcrumb-segments '(symbols) "Path and file visible elsewhere.")
                                        ;  :config
                                        ;  (advice-add 'lsp--locations-to-xref-items
                                        ;              :filter-return #'pszynk/filter-not-python-stub-definitions))
(after! lsp-mode
  ;; Display all of the info returned by document/onHover. If this is nil, eldoc
  ;; will show only the symbol information.
  (setq lsp-eldoc-render-all t ;; maybe a bit much...
        lsp-headerline-breadcrumb-segments '(symbols))
  ;; common place for ignored directories/files?
  ;; used also by .projectile
  (pushnew! lsp-file-watch-ignored-directories
            "[/\\\\]\\.nox\\'"
            "[/\\\\]\\.mypy_cache\\'")
  (advice-add 'lsp--locations-to-xref-items
              :filter-return #'pszynk/filter-not-python-stub-definitions))

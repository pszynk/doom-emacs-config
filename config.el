;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Paweł Szynkiewicz"
      user-mail-address "pszynk@gmail.com"


      ;; Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs the utility of always keeping them on.
      display-line-numbers-type nil

      ;; More common use-case
      evil-ex-substitute-global t)

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
(setq doom-font
      (font-spec
       :family "FantasqueSansMono Nerd Font Mono"
       :size 20
       :weight 'normal))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'gruvbox-dark-soft)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-mbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
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

;; *** atomic-chrome
(use-package! atomic-chrome
  :after-call focus-out-hook
  :config
  (setq atomic-chrome-default-major-mode 'markdown-mode
        atomic-chrome-buffer-open-style 'frame)
  (atomic-chrome-start-server))


;;; Modules

;;; :completion

;;; ivy

;;; +childframe
;;; don't use childrame for those also
;(after! ivy
;  (when (featurep! :completion ivy +childframe)
;    (dolist (fn '(counsel-describe-function counsel-describe-variable))
;      (setf (alist-get fn ivy-posframe-display-functions-alist)
;            #'ivy-display-function-fallback))
;    )
;  )

;;; :editor

;;; :tools

;;; editor
(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
            sql-mode         ; sqlformat is currently broken
            tex-mode         ; latexindent is broken
            latex-mode
            go-mode))        ; too aggresive

;;; lsp
(setq lsp-eldoc-render-all t) ;; maybe a bit much...

;;; magit
(setq magit-repository-directories '(("~/Projects" . 2))
      magit-save-repository-buffers nil
      ;; Don't restore the wconf after quitting magit, it's jarring
      magit-inhibit-save-previous-winconf t)

;;; projectile
(after! projectile
  (setq projectile-ignored-projects '("~/" "/tmp")
        projectile-project-search-path '("~/Projects/prog")
        ))


;;; :lang

;;; org
(setq org-directory "~/projects/org/"
      org-archive-location (concat org-directory ".archive/%s::")
      org-roam-directory (concat org-directory "notes/")
      ;;org-journal-encrypt-journal t
      org-journal-file-format "%Y%m%d.org"
      ;;org-ellipsis " ▼ "
      org-superstar-headline-bullets-list '("#"))


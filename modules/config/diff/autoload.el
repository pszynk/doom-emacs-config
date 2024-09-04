;;; psz-config/diff/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun pszynk/ediff-init-and-example ()
  "ediff the current `init.el' with the example in doom-emacs-dir"
  (interactive)
  (ediff-files (doom-path doom-user-dir "init.el")
               (doom-path doom-emacs-dir "templates" "init.example.el")))

;;; config/diff/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun pszynk/ediff-init-and-example ()
  "ediff the current `init.el' with the example in doom-emacs-dir"
  (interactive)
  (ediff-files (concat doom-private-dir "init.el")
               (concat doom-emacs-dir "init.example.el")))

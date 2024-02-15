;;; tools/atomic-chrome/config.el -*- lexical-binding: t; -*-
(map!
 :after org
 :map org-mode-map
 ;; This shadows org-mode keybinding to 'org-reveal!
 ;; Have no idea what org-reveal is suppose to do?!
 "C-c C-r"  #'(:keymap verb-command-map :package verb :which-key "verb")
 :localleader
 (:prefix ("v" . "verb")
  "f" #'verb-send-request-on-point
  "s" #'verb-send-request-on-point-other-window
  "r" #'verb-set-var
  "m" #'verb-send-request-on-point-no-window
  "k" #'verb-kill-all-response-buffers
  "e" #'verb-export-request-on-point
  "u" #'verb-export-request-on-point-curl
  "b" #'verb-export-request-on-point-verb
  "v" #'verb-send-request-on-point-other-window-stay))

(use-package verb
  :config
  (map!
   (:map verb-response-body-mode-map
    :localleader
    (:prefix  ("v" . "verb")
     "r" #'verb-toggle-show-headers
     "k" #'verb-kill-response-buffer-and-window
     "f" #'verb-re-send-request)))
  (map!
   (:map verb-response-body-mode-map
    :localleader
    (:prefix  ("v" . "verb")
     "q" #'verb-kill-buffer-and-window))))

;; No need to add `verb' to `org-babel-do-load-languages', `doom' is smart enought
;; to lazy-load it when needed:
;; https://github.com/hlissner/doom-emacs/blob/develop/modules/lang/org/README.org#hacks

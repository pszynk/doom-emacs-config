;;; tools/gitlab/config.el -*- lexical-binding: t; -*-

(after! gitlab-ci-mode
  (map! :map gitlab-ci-mode-map
        :localleader
        :desc "Send file to GitLab linter API" "l" #'gitlab-ci-lint))

;; disable by default?
;; (use-package! gitlab-ci-mode-flycheck
;;   :after flycheck gitlab-ci-mode
;;   :init
;;   (gitlab-ci-mode-flycheck-enable))

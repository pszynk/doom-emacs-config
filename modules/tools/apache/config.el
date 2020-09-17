;;; psz-tools/apache/config.el -*- lexical-binding: t; -*-

(use-package! apache-mode
  :mode
  ("\\.htaccess\\'"   . apache-mode)
  ("httpd\\.conf\\'"  . apache-mode)
  ("srm\\.conf\\'"    . apache-mode)
  ("access\\.conf\\'" . apache-mode)
  ("sites-\\(available\\|enabled\\)/" . apache-mode))

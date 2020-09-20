;;; psz-tools/apache/config.el -*- lexical-binding: t; -*-

(use-package! apache-mode
  :mode
  ("\\.htaccess\\'"   . apache-mode)
  ("httpd\\.conf\\'"  . apache-mode)
  ("srm\\.conf\\'"    . apache-mode)
  ("access\\.conf\\'" . apache-mode)
  ("/apache2/sites-\\(available\\|enabled\\)/" . apache-mode))

(use-package! nginx-mode
  :mode
  ("/nginx/sites-\\(available\\|enabled\\)/" . nginx-mode))

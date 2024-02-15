(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((code-review-github-graphql-host . "github.mit.edu/api")
     (code-review-github-host . "github.mit.edu/api/v3")
     (code-review-github-base-url . "github.mit.edu")
     (eval progn
           (setenv "CC" "clang")
           (setenv "CFLAGS" "-Wall -Wextra -Wpedantic -Wformat=2 -Wno-unused-parameter -Wshadow -Wwrite-strings -Wstrict-prototypes -Wold-style-definition -Wredundant-decls -Wnested-externs -Wmissing-include-dirs")
           (add-to-list forge-alist
                        '("github.mit.edu" "github.mit.edu/api/v3" "github.mit.edu" forge-github-repository)))
     (eval progn
           (setenv "CC" "clang")
           (setenv "CFLAGS" "-Wall -Wextra -Wpedantic -Wformat=2 -Wno-unused-parameter -Wshadow -Wwrite-strings -Wstrict-prototypes -Wold-style-definition -Wredundant-decls -Wnested-externs -Wmissing-include-dirs")
           (add-to-list 'forge-alist
                        '("github.mit.edu" "github.mit.edu/api/v3" "github.mit.edu" forge-github-repository)))
     (eval progn
           (setenv "CC" "clang")
           (setenv "CFLAGS" "-Wall -Wextra -Wpedantic -Wformat=2 -Wno-unused-parameter -Wshadow -Wwrite-strings -Wstrict-prototypes -Wold-style-definition -Wredundant-decls -Wnested-externs -Wmissing-include-dirs"))
     (eval
      (progn
        (setenv "CC" "clang")
        (setenv "CFLAGS" "-Wall -Wextra -Wpedantic -Wformat=2 -Wno-unused-parameter -Wshadow -Wwrite-strings -Wstrict-prototypes -Wold-style-definition -Wredundant-decls -Wnested-externs -Wmissing-include-dirs")))
     (eval progn
           (add-to-list 'forge-alist
                        '("github.mit.edu" "github.mit.edu/api/v3" "github.mit.edu" forge-github-repository)))
     (eval progn
           (add-to-list 'forge-alist
                        '("github.mit.edu"
                          (\, "github.mit.edu/api/v3")
                          (\, "github.mit.edu")
                          forge-github-repository)))
     (code-reveiw-github-graphql-host . "github.mit.edu/api")
     (code-reveiw-github-host . "github.mit.edu/api/v3")
     (code-reveiw-github-base-url . "github.mit.edu")
     (eval dap-register-debug-template "pgafilter"
           (list :type "python" :args "" :cwd nil :program "${workspaceFolder}/src/pgafilter.py" :request "launch" :name "pgafilter")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

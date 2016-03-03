;;; marmalade-client-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "marmalade-client" "marmalade-client.el" (22220
;;;;;;  28138 872108 915000))
;;; Generated autoloads from marmalade-client.el

(autoload 'marmalade-upload "marmalade-client" "\
Upload a package to marmalade using `web'.

\(fn PACKAGE-BUFFER USERNAME &optional PASSWORD)" t nil)

(autoload 'marmalade-remove-package "marmalade-client" "\
Ask marmalade to remove a package.

You must be authorized to do so and the package must exist and
all those things.  Marmalade will give an error if it doesn't
like you.

\(fn PACKAGE-NAME USERNAME &optional PASSWORD)" t nil)

(autoload 'marmalade-client-add-owner "marmalade-client" "\
Ask marmalade to add NEW-USERNAME as an owner of PACKAGE-NAME.

You must be authorized to do so and the package must exist and
all those things.  Marmalade will give an error if it doesn't
like you.

\(fn PACKAGE-NAME NEW-USERNAME USERNAME &optional PASSWORD)" t nil)

(autoload 'marmalade-client-list-issues "marmalade-client" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("add-user.el" "marmalade-client-pkg.el")
;;;;;;  (22220 28138 922800 710000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; marmalade-client-autoloads.el ends here

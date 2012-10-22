;; Add Marmalade to the set of repositories
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; List of packages
(setq prelude-packages '(auto-compile
			 auto-complete
			 autopair
			 idle-highlight-mode
			 fill-column-indicator
			 prelude-c
			 prelude-emacs-lisp
			 prelude-xml
			 python-mode))

;; Check them
(prelude-install-packages)

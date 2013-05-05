;; Emacs prelude enable some radical modes that makes it completely different
;; to other common editors.
(defun reconfigure-radical-modes ()
  ;; Enable some keys (arrows, page up/down, etc.)
  (guru-mode -1)
  ;; Enable the menu
  (menu-bar-mode 1)
  (paredit-mode -1))
(add-hook 'prelude-prog-mode-hook 'reconfigure-radical-modes t)
;; The following hook is required to disable paredit
(add-hook 'prelude-emacs-lisp-mode-hook 'reconfigure-radical-modes t)

;;
;; Set some programming variables
;;
(defun apply-code-settings ()
  (setq c-basic-offset 2
	indent-tabs-mode t
	sh-basic-offset 8
	tcl-indent-level 8
	c-block-comment-prefix "* "))
(add-hook 'prelude-prog-mode-hook 'apply-code-settings t)
(add-hook 'prelude-c-mode-common-hook 'apply-code-settings t)


;; Define which kind of white-spaces are shown
(setq whitespace-style
      '(face spaces tabs newline space-mark tab-mark newline-mark lines-tail
             trailing lines empty))

;; Redefine display mapping
;; It solves a problem when a tab occupies exactly one column.
;; This is a copy of the default whitespace-display-mappings without the
;; tab-mark entry.
;; http://emacswiki.org/emacs/WhiteSpace#toc9
(setq whitespace-display-mappings '((space-mark 32 [183] [46])
                                    (space-mark 160 [164] [95])
                                    (space-mark 2208 [2212] [95])
                                    (space-mark 2336 [2340] [95])
                                    (space-mark 3616 [3620] [95])
                                    (space-mark 3872 [3876] [95])
                                    (newline-mark 10 [36 10])))


;; Disable automatic carriage return when writing emails
(add-hook 'mail-mode-hook 'turn-off-auto-fill)

;; Set my font
(add-to-list 'default-frame-alist '(font . "Inconsolata-10"))

;; Open GCC machine descriptions as Emacs lisp files
(add-to-list 'auto-mode-alist '("\\.md\\'" . emacs-lisp-mode))

;; Useful to create some presentation with org-mode
(require 'org-latex)
;; Enable compatibility with X clipper on terminal
(require 'xclip)

;; Indicate the maximum column with a line
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(define-globalized-minor-mode global-fci-mode
  fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(defvar contacts-file
  (quote "~/contacts.org")
  "Address book file")

;; Use org-mode to manage contacts
(require 'org-contacts)
(add-to-list 'org-contacts-files contacts-file)

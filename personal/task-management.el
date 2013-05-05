;; Task managements settings
(defvar gtd-file
  (quote "~/Documents/projects/gtd.org")
  "Main GTD file")

;; Notes file
(defvar notes-file
  (quote "~/Documents/notes.org")
  "Main notes file")

;; Specify which files store tasks
(add-to-list 'org-agenda-files gtd-file)
;; Show blocked items in a dimmed font
(setq org-agenda-dim-blocked-tasks t)

;; Open the main GTD file.
(defun open-gtd-file ()
  (interactive)
  (find-file gtd-file))

;; Open the log view of the org-agenda-mode showing the tasks that reference
;; any time in the current week.
(defun open-org-log ()
  (interactive)
  (org-agenda-list)
  (org-agenda-log-mode)
  (org-agenda-week-view))

(defun toggle-org-agenda-list ()
  "Open the Org Agenda list or close it, when it's already open."
  (interactive)
  (setq buf (buffer-name))
  (if (equal buf "*Org Agenda*")
      (progn
	(delete-window)
	(kill-buffer buf))
    (org-agenda-list)))

;; Keyboard shortcuts
(global-set-key (kbd "<f5>") 'open-gtd-file)

;; Enable some shortcuts only after opening org-mode for the first time
(add-hook 'org-mode-hook
          (lambda ()
            (global-set-key (kbd "<f6>") 'toggle-org-agenda-list)
            (global-set-key (kbd "<f7>") 'org-todo-list)
            (global-set-key (kbd "<f8>") 'open-org-log)
            (local-set-key (kbd "<f9>") 'org-todo)
            (local-set-key (kbd "<f10>") 'org-schedule)
            (local-set-key (kbd "<f11>") 'org-clock-in)
            (global-set-key (kbd "<f12>") 'org-clock-out)
            ))

;; Make the some shortcuts available during org-agenda-mode
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (local-set-key (kbd "<f9>") 'org-agenda-todo)
            (local-set-key (kbd "<f10>") 'org-agenda-schedule)
            (local-set-key (kbd "<f11>") 'org-agenda-clock-in)
            (local-set-key (kbd "<f12>") 'org-agenda-clock-out)
            ))

;; Set the notes file to use with org-capture
(setq org-default-notes-file notes-file)

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Cezary Drożak"
      user-mail-address "czarek@drozak.net")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq notes-dir
      (or
       (file-exists-p! "~/notes")
       "~/projects/notes"))
(setq org-directory notes-dir)
(setq deft-directory notes-dir)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

;; LaTeX-mode-map
(map! (:when (featurep! :lang latex)    ; local conditional
        (:map LaTeX-mode-map
          :localleader                  ; Use local leader
          :desc "View" "v" #'TeX-view ; Add which-key description
          :desc "Run all" "a" #'TeX-command-run-all))) ; Add which-key description

(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (setq-default TeX-master nil))) ; Query for master file

(add-hook 'TeX-language-pl-hook
          (lambda () (ispell-change-dictionary "polish")))

;; Add keybindings for C-c and C-x
;; Source: https://emacs.stackexchange.com/a/48572
(defun nawordar/C-c ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-c"))))

(defun nawordar/C-x ()
  (interactive)
  (setq unread-command-events (listify-key-sequence (kbd "C-x"))))

(map!
 :leader
 :desc "C-c" "z" #'nawordar/C-c
 :desc "C-x" "x" #'nawordar/C-x)

;; Add Spacemacs-inspired keybindings for iedit-mode
(use-package! evil-iedit-state
  :init
  (map!
   :leader
   :desc "iedit-mode" "e" #'evil-iedit-state/iedit-mode))

;; :map (iedit-mode-keymap iedit-mode-occurrence-keymap)
;;   :nv "n" #'iedit-next-occurrence
;;   :nv "N" #'iedit-prev-occurrence
;;   :nv "F" #'iedit-restrict-function
;;   :nv "L" #'iedit-restrict-current-line
;;   :nv "R" #'iedit-restrict-region
;;   :nv "J" #'iedit-expand-by-a-line
;;   :nv "K" #'iedit-expand-up-a-line
;;   "<tab>" #'iedit-toggle-selection
;;   "<escape>" #'iedit-mode))


;; ;; Configure ~fira-code-mode~
;; (use-package! fira-code-mode
;;   :hook prog-mode)

;; Add mu4e to emacs path
(add-load-path! "/usr/local/share/emacs/site-lisp/mu4e")

;; Change backup directory. Source: https://stackoverflow.com/a/22176971
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

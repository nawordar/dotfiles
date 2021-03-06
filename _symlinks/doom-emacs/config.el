;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Cezary Drożak"
      user-mail-address "czarek@drozak.net")

;; ;; Synchronize environment variables
(exec-path-from-shell-initialize)
(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font
      (font-spec :family "Iosevka" :size 14)
      doom-variable-pitch-font
      (font-spec :family "Cantarell" :size 12))

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

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq-default indent-tabs-mode       nil)
(setq-default tab-width              4)
(setq         indent-line-function   'insert-tab)
(setq         typescript-indent-level 2)

;; LaTeX-mode-map
(map! (:when (featurep! :lang latex)
        (:map LaTeX-mode-map
          :localleader
          :desc "View" "v" #'TeX-view
          :desc "Run all" "a" #'TeX-command-run-all)))

;; c++-mode-map
(map! (:when (featurep! :lang cc)
        (:map (c++-mode-map c-mode-map)
          "C-c C-o" #'ff-find-other-file)
        :leader
        :desc "Find other file" "f o" #'ff-find-other-file))

;; Enable anzu
(use-package! anzu
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

;; TODO: Use flyspell-babel.el instead -- https://tex.stackexchange.com/a/82191
;; (add-hook! 'TeX-language-pl-hook
;;   (ispell-change-dictionary "polish"))
(use-package! ispell
  :config
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary   "pl_PL,en_US")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "pl_PL,en_US"))

(use-package! company-dict
  :custom
  (company-dict-enable-fuzzy t))

(use-package! srefactor
  :config
  (semantic-mode 1)
  :init
  (map! (:map (c++-mode-map c-mode-map)
          "M-RET" #'srefactor-refactor-at-point)))

;; Automatically change the global theme according to major mode
;; Source: https://stackoverflow.com/a/56770454
;; https://hg.serna.eu/emacs/per-buffer-theme
(use-package! per-buffer-theme
  :custom
  (per-buffer-theme/use-timer t)
  (per-buffer-theme/timer-idle-delay 0.1)
  (per-buffer-theme/default-theme 'doom-one)
  (per-buffer-theme/themes-alist
   '(((:theme . doom-one-light)
      (:buffernames nil)
      (:modes reftex-mode tex-mode plain-tex-mode TeX-special-mode latex-mode bibtex-mode))))

  :config
  (setq per-buffer-theme/ignored-buffernames-regex
        (append '("*anaconda-mode*"
                  "*Backtrace*"
                  "*Buffer List*"
                  "*compilation*"
                  "*Compile-Log*"
                  "*Completions*"
                  "*ESS*"
                  "*Flymake log*"
                  "*Help*"
                  "*Ibuffer"
                  "*info*"
                  "*Messages*"
                  "*Warnings*")
                per-buffer-theme/ignored-buffernames-regex)))

(use-package! tex
  :custom
  (TeX-master     nil "Query for master file")
  (TeX-PDF-mode   t   "Compile to pdf instead of dvi")
  (TeX-parse-self t   "Enable parse on load")
  (TeX-auto-save  t   "Enable parse on save")
  (TeX-fold-auto  nil "Automaticaly fold macros")
  (auto-fill-mode t   "Automaticaly fill paragraphs")
  (+latex-viewers '(zathura)))

(add-hook! 'LaTeX-mode-hook
  (turn-on-auto-fill))
;; (TeX-fold-mode 1))

;; (add-hook 'find-file-hook 'TeX-fold-buffer t)

(setq preview-auto-cache-preamble t)

;; Add Spacemacs-inspired keybindings for iedit-mode
(use-package! evil-iedit-state
  :init
  (map!
   :leader
   :desc "iedit-mode" "e" #'evil-iedit-state/iedit-mode))

(load! "major-mode/d-lang.el")

(add-load-path! "/usr/local/share/emacs/site-lisp/mu4e")

;; Change backup directory. Source: https://stackoverflow.com/a/22176971
;; (defvar --auto-save-dir (concat user-emacs-directory "auto-save/"))
;; (if (not (file-exists-p --auto-save-dir))
;;     (make-directory --auto-save-dir t))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,--auto-save-dir t)))

;; (defvar --backup-dir (concat user-emacs-directory "backups"))
;; (if (not (file-exists-p --backup-dir))
;;     (make-directory --backup-dir t))
;; (setq backup-directory-alist
;;       `(("." . ,(expand-file-name --backup-dir))))

;; Based on: https://github.com/HarrisonTotty/dotfiles/blob/a3973dd61de6aa22b141571026f2eb6c0a684c98/src/emacs/config.el
(add-hook! 'typescript-mode-hook
  (set-pretty-symbols! 'typescript-mode nil)
  (set-pretty-symbols! 'typescript-mode :lambda "() =>"
    :power_2 "^2"))

(add-hook! 'c++-mode-hook
  (set-pretty-symbols! 'c++-mode nil))
;; (set-pretty-symbols! 'typescript-mode :lambda "() =>"
;;   :power_2 "^2"))

;; (add-hook! 'LaTeX-mode-hook
;;   (setq prettify-symbols-alist
;;         (seq-remove
;;          (lambda (elt)
;;            (string= (car elt) "x"))
;;          prettify-symbols-alist)))
;; (prettify-symbols-mode -1)
;; (prettify-symbols-mode 1))

;; (add-hook 'LaTeX-mode-hook
;;           (lambda ()
;;             (push '("x" . ?x) prettify-symbols-alist)))

(add-hook! 'prettify-symbols-mode-hook
  (when (derived-mode-p 'latex-mode)
    (push '("x" . ?x) prettify-symbols-alist)))

;; Remove all default pretty-code symbols
(setq +pretty-code-symbols '(
                             :lambda "λ"
                             :power_2 "²"))

;; Don't break my json-c!
(setq +format-on-save-enabled-modes
      (append +format-on-save-enabled-modes
              '(json-mode)
              '(c++-mode)))

(prodigy-define-service
  :name "Typescript watch inline-style-injector"
  :command "tsc"
  :args '("--watch")
  :cwd "~/projects/inline-style-injector"
  :tags '(typescript node))

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

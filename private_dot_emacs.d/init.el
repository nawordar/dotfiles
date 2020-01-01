(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'auctex-latexmk)
(auctex-latexmk-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (ergoemacs-mode auctex-latexmk))))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'LaTeX-mode-hook '(lambda ()
		      (progn
			(turn-on-reftex)
			(LaTeX-math-mode  1)
			(flyspell-mode    1)
			(auto-fill-mode   1)
			(setq fill-column 95)
			(parenthesis-register-keys "{([$" LaTeX-mode-map)
			(outline-minor-mode t)
			(setq latex-mode-map LaTeX-mode-map)
			(yas/reload-all)
			(add-to-list 'TeX-command-list
				     '("images" "utils.py svg2pdf"
				       TeX-run-command nil t))
			(add-to-list 'TeX-command-list
				     '("make" "latexmk -pdf %s"
				       TeX-run-TeX nil t
				       :help "Run Latexmk on file")))))

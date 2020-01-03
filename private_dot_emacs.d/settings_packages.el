;; === ergoemacs === ;;
;; (defvar ergoemacs-modify-transient-maps)
;; (setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;; (setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;; (ergoemacs-mode 1)

;; === latex === ;;
(auctex-latexmk-setup)

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

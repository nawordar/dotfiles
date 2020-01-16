;; === ergoemacs === ;;
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")

(ergoemacs-mode 1)

;; === which-key === ;;
(which-key-mode)

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

;; === projectile === ;;
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

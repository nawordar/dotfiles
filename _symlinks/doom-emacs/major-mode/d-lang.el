;;; $DOOMDIR/major-mode/d-lang.el -*- lexical-binding: t; -*-


;; (use-package! ac-dcd
;;   :config
;;   (add-hook! 'd-mode-hook
;;     (flycheck-dmd-dub-set-variables)
;;     (auto-complete-mode t)
;;     (when (featurep 'yasnippet) (yas-minor-mode-on))
;;     (ac-dcd-start-server)
;;     (ac-dcd-add-imports)
;;     (add-to-list 'ac-sources 'ac-source-dcd)
;;     ;; (define-key d-mode-map (kbd "C-c ?") 'ac-dcd-show-ddoc-with-buffer)
;;     ;; (define-key d-mode-map (kbd "C-c .") 'ac-dcd-goto-definition)
;;     ;; (define-key d-mode-map (kbd "C-c ,") 'ac-dcd-goto-def-pop-marker)
;;     ;; (define-key d-mode-map (kbd "C-c s") 'ac-dcd-search-symbol)
;;     (set-lookup-handlers! 'd-mode
;;       :definition    'ac-dcd-goto-definition
;;       :documentation 'ac-dcd-show-ddoc-with-buffer
;;       :file          'ac-dcd-search-symbol)
;;     (when (featurep 'popwin)
;;       (add-to-list 'popwin:special-display-config
;;                    `(,ac-dcd-error-buffer-name :noselect t))
;;       (add-to-list 'popwin:special-display-config
;;                    `(,ac-dcd-document-buffer-name :position right :width 80))
;;       (add-to-list 'popwin:special-display-config
;;                    `(,ac-dcd-search-symbol-buffer-name :position bottom :width 5)))))

;; (use-package! company-dcd
;;   :hook ((d-mode . company-dcd-mode)
;;          (d-mode . flycheck-dmd-dub-set-variables)))

;; (use-package! company-dcd
;;   :config
;;   (add-hook! 'd-mode-hook
;;     (company-dcd-mode)
;;     (flycheck-dmd-dub-set-variables)))


;; (use-package! lsp
;;   :config
;;   (add-hook 'd-mode-hook #'lsp)
;;   (add-to-list 'lsp-language-id-configuration '(d-mode . "D"))
;;   (setq lsp-log-io t)
;;   (lsp-register-client
;;    (make-lsp-client
;;     :new-connection (lsp-stdio-connection '("/home/nawordar/.dub/packages/serve-d-0.6.0/serve-d/serve-d" "--wait"))
;;     :notification-handlers (lsp-ht ("coded/changedSelectedWorkspace" 'ignore))
;;     :major-modes '(d-mode)
;;     :language-id "D"
;;     :priority 0
;;     :server-id 'serve-d)))

(after! lsp-mode
  (setq lsp-log-io t)
  (setq lsp-dlang-serve-d-server-path "/home/nawordar/clones/serve-d/serve-d")
  (setq lsp-response-timeout 9999999))

(when (featurep! :tools lookup +docsets)
  (set-docsets! 'd-mode "D"))

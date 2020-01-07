(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Replace find-file keybindings with ffap-based versions – Source: https://stackoverflow.com/a/259376/9327802
(ffap-bindings)

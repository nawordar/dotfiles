(defun mc-mode ()
  "Major mode for managing multiple cursors"
  (interactive)
;;   (kill-all-local-variables)
  (use-local-map (let ((map (make-keymap)))
		   (define-key map "i" (lambda () (interactve)
					 (call-interactively 'mc/edit-lines)
					 (mc-mode)))
    map)))

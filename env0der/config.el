;; Cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "s-w") 'kill-this-buffer)

(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

;; better ruby intendation
(setq ruby-deep-indent-paren nil)
(setq enh-ruby-deep-indent-paren nil)
(setq js-indent-level 2)

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(setq ido-auto-merge-work-directories-length -1)

;; show system name and current file path in window title
(setq-default frame-title-format (list (system-name) ": %b (%f)"))

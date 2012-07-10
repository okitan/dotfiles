(add-to-list 'auto-mode-alist '("\\Gemfile$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile.lock$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Rakefile$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Procfile$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$"     . ruby-mode))

;;; rspec-mode
(el-get 'sync 'rspec-mode)

(when (require 'rspec-mode nil t))

;; indent
(setq ruby-deep-indent-paren-style nil)
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

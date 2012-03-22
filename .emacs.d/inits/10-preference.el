;;; utf-8
(prefer-coding-system 'utf-8)

;;; display preference
(menu-bar-mode 0)
(column-number-mode t)

;;; paren
(setq show-paren-delay 0)
(show-paren-mode t)

;;; space and newline
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

;;; C-k
(setq kill-whole-line t)

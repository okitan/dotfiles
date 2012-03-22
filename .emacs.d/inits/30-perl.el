;; cperl-mode
(defalias 'perl-mode 'cperl-mode)

(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"  . cperl-mode))

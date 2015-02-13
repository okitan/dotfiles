;; cperl-mode
(defalias 'perl-mode 'cperl-mode)

(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"  . cperl-mode))

(add-hook 'cperl-mode-hook
          '(lambda ()
                  (cperl-set-style "PerlStyle")))

;; indent
(custom-set-variables
 '(cperl-indent-parens-as-block t)
 '(cperl-indent-subs-specially nil)
 '(cperl-close-paren-offset -4))

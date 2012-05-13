(add-to-list 'auto-mode-alist '("\\Gemfile$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile.lock$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Rakefile$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Procfile$"     . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$"     . ruby-mode))

;;; rspec-mode
(el-get 'sync 'rspec-mode)

(when (require 'rspec-mode nil t))

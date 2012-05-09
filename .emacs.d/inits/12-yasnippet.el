(el-get 'sync 'yasnippet)

(when (require 'yasnippet nil t)
  (setq yas/root-directory
	'("~/.emacs.d/etc/snippets"
	  "~/.emacs.d/el-get/yasnippet/snippets"))
  (mapc 'yas/load-directory yas/root-directory)

  (yas/global-mode 1)

  (add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))
)

;;; disable backup at first
(setq backup-inhibited t)

;;; load-path
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/elisp")

;;; init-loader
;; init-loader is installed by executing init.sh
(when (require 'init-loader nil t)
  (init-loader-load))

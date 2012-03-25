;;; disable backup at first
(setq backup-inhibited t)

;;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")

;;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; if there is no el-get, install
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)))))
;;  (with-current-buffer
;;    (url-retrieve-synchronously
;;       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;    (end-of-buffer)
;;    (eval-print-last-sexp)))
;; synchronous install
(el-get 'sync)

;;; init-loader
;; init-loader is installed by executing init.sh
(when (require 'init-loader nil t)
  (init-loader-load))

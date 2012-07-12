;;; disable backup at first
(setq backup-inhibited t)

;;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; if there is no el-get, install
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

;; original rpc
(setq el-get-sources
      '(
        (:name init-loader
               :type http
               :description "init-loader"
               :url "https://raw.github.com/gist/1021706/init-loader.el")
        ))
(el-get 'sync)

;;; init-loade
(el-get 'sync 'init-loader)

(require 'init-loader)
(init-loader-load)

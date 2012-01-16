; 日本語をデフォルトにする。
(set-language-environment "Japanese")
; anthy.el をロードできるようにする (必要に応じて)。
;(push "/usr/local/share/emacs/site-lisp/anthy/" load-path)
; anthy.el をロードする。
;(load-library "anthy")
; japanese-anthy をデフォルトの input-method にする。
(setq default-input-method "japanese-anthy")

; menu bars
(tool-bar-mode -1)
(menu-bar-mode -1)

;; disable backup
(setq backup-inhibited t)

;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; init-loader
(require 'init-loader)
(init-loader-load)

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)

;; auto-async-byte-complile
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; auto-install is installed by executing init.sh
(when (require 'auto-install nil t)
  (auto-install-update-emacswiki-package-name t))

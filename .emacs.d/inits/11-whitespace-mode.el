(require 'whitespace)

;;; line width
(setq whitespace-line-column 120)

;;; what to mark
(setq whitespace-style '(face tabs tab-mark newline newline-mark lines-tail empty))

;;; display
(setq whitespace-display-mappings
      '((newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n])
	(tab-mark     ?\t    [?\xBB ?\t]   [?\\ ?\t])))

;;; face
(set-face-foreground 'whitespace-tab "#adff2f")
(set-face-underline-p 'whitespace-tab t)
(set-face-foreground 'whitespace-newline "#ffccff")

(global-whitespace-mode 1)

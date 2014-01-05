(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(org-export-html-postamble nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Lucida Console" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

;; Automatic timestamp when marking org todo item as done
(setq org-log-done 'time)
;; Source block higlighting in org mode
(setq org-src-fontify-natively t)

(setq org-export-html-use-infojs t)
(defun org-jsinfo-settings ()
    "Settings for org-jsinfo."
    (setcdr (assoc 'view org-infojs-options) "showall"))

  (eval-after-load "org-jsinfo"
    '(org-jsinfo-settings))

;; and highlight oracle keywords in sql
(add-hook 'sql-mode-hook
          (lambda ()
            (sql-highlight-oracle-keywords)))



;; Make html export for org-mode include a custom CSS file inline.
(let* ((dir (ignore-errors (file-name-directory (buffer-file-name))))
       (path (concat dir "style.css"))
       (homestyle (or (null dir) (null (file-exists-p path))))
       (final (if homestyle "~/.emacs.d/org-style.css" path)))
  (setq org-export-html-style-include-default nil)
  (setq org-export-html-style (concat
			       "<style type=\"text/css\">\n"
			       "<!--/*--><![CDATA[/*><!--*/\n"
			       (with-temp-buffer
				 (insert-file-contents final)
				 (buffer-string))
			       "/*]]>*/-->\n"
			       "</style>\n")))

(add-hook 'java-mode-hook 'linum-mode)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(require 'fill-column-indicator)
(setq-default fill-column 80)
(column-number-mode 1)





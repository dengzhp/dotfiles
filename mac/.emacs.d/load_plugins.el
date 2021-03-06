;;global
(autoload 'gtags-mode "gtags" "" t)

(setq gtags-suggested-key-mapping t)

(add-hook 'gtags-select-mode-hook
  '(lambda ()
     (setq hl-line-face 'underline)
     (hl-line-mode 1)
))

(setq gtags-mode-hook
   '(lambda ()
         (define-key gtags-mode-map "\eh" 'gtags-display-browser)
         (define-key gtags-mode-map "\C-]" 'gtags-find-tag-from-here)
         (define-key gtags-mode-map "\C-t" 'gtags-pop-stack)
 ;;      (define-key gtags-mode-map "\el" 'gtags-find-file)
 ;;      (define-key gtags-mode-map "\eg" 'gtags-find-with-grep)
 ;;      (define-key gtags-mode-map "\eI" 'gtags-find-with-idutils)
 ;;      (define-key gtags-mode-map "\es" 'gtags-find-symbol)
 ;;      (define-key gtags-mode-map "\er" 'gtags-find-rtag)
 ;;      (define-key gtags-mode-map "\et" 'gtags-find-tag)
 ;;      (define-key gtags-mode-map "\ev" 'gtags-visit-rootdir)
))

;(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;;google region
(defun google-region (beg end) "Google the selected region." (interactive "r") (
browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" (buffer-substring beg end))))
(global-set-key (kbd "C-M-g") 'google-region)

;;(load "~/.emacs.d/plugins/nxhtml/autostart")

;; MIT Scheme
(setenv "MITSCHEME_LIBRARY_PATH"  "/Applications/mit-scheme.app/Contents/Resources")

;;auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; auto-complete-clang
;; https://github.com/mikeandmore/auto-complete-clang/
(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)

(defun my-c-mode-common-hook()
  (define-key c-mode-base-map (kbd "M-/") 'ac-complete-clang)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;smex  https://github.com/nonsequitur/smex
;(require 'smex) ; Not needed if you use package.el
;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;(add-to-list 'load-path
;              "~/.emacs.d/plugins/weibo.emacs")

;(require 'weibo)

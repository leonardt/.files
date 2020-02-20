(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pbcopy evil-org cmake-mode yaml-mode magit nord-theme exec-path-from-shell evil)))
 '(safe-local-variable-values (quote ((flycheck-gcc-language-standard . c++17)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode 1)
(global-linum-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)
(require-package 'evil-org)
(require-package 'evil-commentary)
(require-package 'evil-leader)
(require-package 'evil-tabs)
(require-package 'evil-collection)
(require-package 'evil-magit)
(require-package 'magit)
(require-package 'nord-theme)
(require-package 'exec-path-from-shell)
(require-package 'projectile)
(require-package 'clang-format)
(require-package 'yaml-mode)
;; (require-package 'dashboard)
(require-package 'rainbow-delimiters)
(require-package 'flycheck)
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company)
(require-package 'company-lsp)
(require-package 'cmake-mode)
(require-package 'helm)
(require-package 'helm-projectile)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(require 'company-lsp)
(push 'company-lsp company-backends)
(add-hook 'after-init-hook 'global-company-mode)

(require 'lsp-mode)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)

;; (dashboard-setup-startup-hook)

(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; from https://github.com/piger/flycheck-pycodestyle/blob/master/flycheck-pycodestyle.el
;; but so simple, I just copied it here
;; (require 'flycheck)
;; (flycheck-define-checker python-pycodestyle
;;   "A Python syntax and style checker using pycodestyle (former pep8)."

;;   :command ("pycodestyle" source-inplace)
;;   :error-patterns
;;   ((error line-start (file-name) ":" line ":" column ":" (message) line-end))
;;   :modes python-mode)

;; (add-to-list 'flycheck-checkers 'python-pycodestyle)
;; (setq flycheck-verilog-verilator-executable "exec-verilator.sh")


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))


(require 'saveplace)
(setq-default save-place t)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; compile
(setq-default compilation-always-kill t)
(setq-default compilation-ask-about-save nil)
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; clean up old buffers periodically
(require 'midnight)
(midnight-delay-set 'midnight-delay 0)
(setq delete-by-moving-to-trash t)

(blink-cursor-mode -1)
(electric-indent-mode t)
(electric-pair-mode t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun clang-format-buffer-smart ()
  "Reformat buffer if .clang-format exists in the projectile root."
  (when (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
    (clang-format-buffer)))

(defun clang-format-buffer-smart-on-save ()
  "Add auto-save hook for clang-format-buffer-smart."
  (add-hook 'before-save-hook 'clang-format-buffer-smart nil t))

(add-hook 'c-mode-hook 'clang-format-buffer-smart-on-save)
(add-hook 'c++-mode-hook 'clang-format-buffer-smart-on-save)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'magit)
(require 'projectile)
(require 'helm-config)
(require 'helm-projectile)
(projectile-global-mode)
(helm-projectile-on)

(require 'yaml-mode)

(setq evil-want-keybinding nil)

(require 'evil)
(evil-mode t)

(require 'evil-collection)
(evil-collection-init)

(require 'evil-magit)

(require 'evil-commentary)
(evil-commentary-mode)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(global-evil-tabs-mode t)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

(evil-leader/set-key
 "x" 'helm-M-x
 "m" 'helm-mini
 "b" 'helm-buffers-list
 "f" 'helm-find-files
 "p" 'helm-projectile
 "c" 'compile
 "r" 'recompile
 "e s" 'eshell
 "g s" 'magit-status
 "g p s" 'magit-push
 "g p l" 'magit-pull
 "g c" 'magit-commit)

(add-hook 'org-mode-hook 'evil-org-mode)
(add-hook 'evil-org-mode-hook
	  (lambda ()
	    (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

;; Verilog mode disable auto formatting                                   

(eval-after-load 'verilog-mode
    '(progn
        ;; same for all the electric-verilog-* commands in                
        ;; the mode's map (see verilog-mode.el)                      
        (define-key verilog-mode-map (kbd ";") 'self-insert-command)
        (define-key verilog-mode-map (kbd ":") 'self-insert-command)
        (define-key verilog-mode-map (kbd "RET") 'evil-ret)
        (define-key verilog-mode-map (kbd "TAB") 'tab-to-tab-stop)))

(load-theme 'nord t)

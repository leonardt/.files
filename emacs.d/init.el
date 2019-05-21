(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode magit nord-theme exec-path-from-shell evil))))
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
(require-package 'evil-commentary)
(require-package 'evil-leader)
(require-package 'magit)
(require-package 'nord-theme)
(require-package 'exec-path-from-shell)
(require-package 'fzf)
(require-package 'projectile)
(require-package 'smex)
(require-package 'clang-format)
(require-package 'yaml-mode)
(require-package 'dashboard)
(require-package 'rainbow-delimiters)

(dashboard-setup-startup-hook)

(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)


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
(require 'fzf)
(require 'projectile)
(require 'smex)
(smex-initialize)

(require 'yaml-mode)

(require 'evil)
(evil-mode t)

(require 'evil-commentary)
(evil-commentary-mode)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
 "x" 'smex
 "f" 'fzf
 "c" 'compile
 "r" 'recompile
 "e s" 'eshell
 "g s" 'magit-status
 "g p s" 'magit-push
 "g p l" 'magit-pull
 "g c" 'magit-commit)

(load-theme 'nord t)

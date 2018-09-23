(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'saveplace)
(setq-default save-place t)

(fset 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; (display-time-mode 1)

(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))

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

(setq-default indent-tabs-mode nil
              default-tab-width 2)

(blink-cursor-mode -1)
(electric-indent-mode t)
(electric-pair-mode t)

(global-aggressive-indent-mode 1)

;; tramp, for sudo access
(require 'tramp)
(setenv "TMPDIR" "/tmp")
;; keep in mind known issues with zsh - see emacs wiki
;; (setq tramp-default-method "sshx")
(setq tramp-default-method "ssh")
;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
;; Backup (file~) disabled and auto-save (#file#) locally to prevent delays in editing remote files
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory temporary-file-directory)
(setq tramp-verbose 10)

(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

(global-hl-line-mode)

;; (setq-default truncate-lines t)

;; Show absolute line number for current line
(defvar linum-relative-current-symbol "")
(require 'linum-relative)
(setq linum-relative-format "%3s ")

(global-linum-mode 1)

(require 'recentf)

(add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")

(recentf-mode +1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; (linum-on)


;; (defadvice linum-update-window (around linum-dynamic activate)
;;   (let* ((w (length (number-to-string
;;                      (count-lines (point-min) (point-max)))))
;;          (linum-format (concat " %" (number-to-string w) "d ")))
;;     ad-do-it))

; (fringe-mode -1)
(require 'linum-off)
(setq-default ispell-program-name "aspell")
(setq-default ispell-dictionary "english")
(require 'flyspell)
(setq ispell-program-name "aspell")
(add-hook 'markdown-mode-hook '(lambda () (flyspell-mode 1)))
(add-hook 'text-mode-hook '(lambda () (flyspell-mode 1)))
(require 'helm-flyspell)
(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)

(require 'evil)

(evil-mode 1)

(require 'evil-terminal-cursor-changer)
(unless (display-graphic-p)
  (setq evil-visual-state-cursor 'box) ; █
  (setq evil-insert-state-cursor 'bar) ; ⎸
  (setq evil-emacs-state-cursor 'hbar) ; _
  )

(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
(global-evil-surround-mode t)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;; (global-evil-snipe-mode 1)

(evil-commentary-mode)

(require 'evil-org)

(require 'helm-projectile)
(setq projectile-mode-line "Projectile")
(projectile-global-mode)
(helm-projectile-on)

(require 'smartparens-config)
(setq sp-autoskip-closing-pair 'always)
(show-smartparens-global-mode t)
(smartparens-global-mode t)

(require 'magit)
(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

(setq magit-last-seen-setup-instructions "1.4.0")

;; auto-indent on RET
(define-key global-map (kbd "RET") 'newline-and-indent)

(evil-leader/set-key
  "x" 'helm-M-x
  "m" 'helm-mini
  "b" 'helm-buffers-list
  "y" 'helm-show-kill-ring
  "i" 'helm-semantic-or-imenu
  "o" 'helm-occur
  "a" 'helm-projectil-ag
  "y" 'helm-show-kill-ring
  "c" 'compile
  "r" 'recompile
  "e s" 'eshell
  "g s" 'magit-status
  "g p s" 'magit-push
  "g p l" 'magit-pull
  "g c" 'magit-commit
  "f" 'helm-find-files)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

(require 'helm-eshell)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key evil-insert-state-map (kbd "C-r")  'helm-eshell-history)))

(setq helm-split-window-in-side-p       t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp    t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
(setq helm-display-header-line nil) ;; t by default
(set-face-attribute 'helm-source-header nil :height 0.1)
(helm-autoresize-mode t)

(require 'helm)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i")   'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")   'helm-select-action) ; list actions using C-z

(setq helm-semantic-fuzzy-match   t
      helm-projectile-fuzzy-match t
      helm-imenu-fuzzy-match      t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(helm-mode 1)

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "<tab>") 'company-select-next)
(define-key company-active-map (kbd "<backtab>") 'company-select-previous)
;; 0.1 second delay before the pop-up appears
(setq company-idle-delay 0.0)
;; you only need to enter one character in a buffer before auto-completion starts
(setq company-minimum-prefix-length 1)

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/dotfiles/emacs.d/.cask/24.4.91.1/elpa/yasnippet-20150318.348/snippets"
        ))

(yas-global-mode 1)

(add-hook 'term-mode-hook
          (lambda()
            (setq yas-dont-activate t)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
    (backward-char 1)
    (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas/minor-mode)
        (null (do-yas-expand)))
    (if (check-expansion)
        (progn
          (company-manual-begin)
          (if (null company-candidates)
          (progn
            (company-abort)
            (indent-for-tab-command)))))))))

(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (do-yas-expand)))
      (if company-candidates
      (company-complete-selection)
    (if (check-expansion)
      (progn
        (company-manual-begin)
        (if (null company-candidates)
        (progn
          (company-abort)
          (yas-next-field))))
      (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (do-yas-expand))
      (company-abort))
      (company-complete-selection)))

(defun abort-company-or-yas ()
  (interactive)
  (if (null company-candidates)
      (yas-abort-snippet)
    (company-abort)))

(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "TAB") 'tab-indent-or-complete)
(global-set-key [(control return)] 'company-complete-common)

(define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)


(setq company-global-modes
    '(not
	eshell-mode comint-mode org-mode erc-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)
(elpy-enable)

(add-to-list 'auto-mode-alist '("\\.upc\\'" . c-mode))

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(require 'diminish)
(diminish 'helm-mode)
(diminish 'smartparens-mode)
(diminish 'evil-snipe-mode)
(diminish 'undo-tree-mode)
(diminish 'projectile-mode)
(diminish 'magit-auto-revert-mode)

(setq-default sml/theme 'dark)
(sml/setup)
(load-theme 'nord t)



;; (add-to-list 'default-frame-alist
;; 	     '(font . "Droid Sans Mono-12"))

;; (add-to-list 'default-frame-alist
;;              '(font . "Inconsolata-g For Powerline-12"))
(add-to-list 'default-frame-alist
             '(font . "Monaco-12"))

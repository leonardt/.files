(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (yaml-mode zenburn-theme web-mode warm-night-theme use-package solarized-theme smex smartparens smart-mode-line-powerline-theme rainbow-delimiters prodigy popwin pip-requirements pandoc-mode pallet nyan-mode nord-theme multiple-cursors material-theme magit lsp-ui linum-relative linum-off leuven-theme lean-mode idle-highlight-mode htmlize helm-projectile helm-flyspell helm-ag gruvbox-theme gotham-theme flycheck-cask flatui-theme expand-region exec-path-from-shell evil-terminal-cursor-changer evil-surround evil-snipe evil-org evil-leader evil-commentary evil-args elpy drag-stuff diminish darktooth-theme company-lsp ample-theme aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(fset 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq markdown-command "pandoc")

(require 'evil)
(evil-mode 1)

(require 'evil-terminal-cursor-changer)
(unless (display-graphic-p)
  (setq evil-motion-state-cursor 'box)  ; █
  (setq evil-visual-state-cursor 'box)  ; █
  (setq evil-normal-state-cursor 'box)  ; █
  (setq evil-visual-state-cursor 'box) ; █
  (setq evil-insert-state-cursor 'bar) ; ⎸
  (setq evil-emacs-state-cursor 'hbar) ; _
  (evil-terminal-cursor-changer-activate)
  )

(evil-commentary-mode)


(require 'helm-config)
(require 'helm-projectile)
(setq projectile-mode-line "Projectile")
(projectile-global-mode)
(helm-projectile-on)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

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
 "g c" 'magic-commit
 "f" 'helm-find-files)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

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

(global-flycheck-mode)
(global-display-line-numbers-mode)

(setq-default sml/theme 'dark)
(sml/setup)

(load-theme 'nord t)

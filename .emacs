;; remove all the *bars
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; remove the startup-screen
(setq inhibit-startup-screen t)

;; Highlight current line.
(global-hl-line-mode t)

;; font
(set-frame-font "Iosevka-10" nil t)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" default))
 '(package-selected-packages
   '(org-roam racket-mode lsp-mode emacs-lsp projectile yasnippet helm flycheck slime auctex paredit magit use-package with-editor transient epl dash bind-key async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; Git integration
(use-package magit
  :ensure t)

;; Theme
(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn))

;; Parenthesis handling
(use-package paredit
  :ensure t
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
    ;;(add-hook 'scheme-mode-hook 'paredit-mode)
    (add-hook 'scheme-mode-hook 'paredit-mode)
    (add-hook 'scheme-repl-mode-hook 'paredit-mode))
  :config
  (show-paren-mode t))

;; LateX support
(use-package tex
  :ensure auctex)

;; Common Lisp support
(use-package slime
  :ensure t)

;; Syntax checking
(use-package flycheck
  :ensure t
  :init
  (add-hook 'scheme-mode-hook 'flycheck-mode))

;; Completion framework
(use-package helm
  :ensure t)

;; Template system
(use-package yasnippet
  :ensure t)

;; Project Interaction Library
(use-package projectile
  :ensure t)

;; Scheme support
(use-package racket-mode
  :ensure t)

;; Language Server Protocol support for Emacs
(use-package lsp-mode
  :ensure t)

;; A plain-text knowledge management system
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t))

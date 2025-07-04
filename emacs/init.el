;; AV's configuration / 250704-b
;; Based on David's init.el from https://github.com/daviwil/emacs-from-scratch/blob/3075158cae210060888001c0d76a58a4178f6a00/init.el
;; =================================================================================================================================

;; Visual tweaks
;; -------------

(setq inhibit-startup-message t)
(setq visual-bell t)
(tool-bar-mode -1)
(tooltip-mode -1)
(display-battery-mode t)
(display-time-mode t)
(set-fringe-mode 10)
(load-theme 'modus-vivendi)

;; Package management
;; ------------------

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; This sometimes doesn't work and needs investigation and debugging!
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Package setup
;; -------------

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Need to manually install nerd-icons using the command M-x nerd-icons-install-fonts on MS-Windows
(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

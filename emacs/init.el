;; AV's configuration
;; ==================

;; Visual tweaks
;; -------------

(setq inhibit-startup-message t)
(setq visual-bell t)
(tool-bar-mode nil)
(tooltip-mode nil)
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
;; (unless (package-install-p 'use-package)
;;  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Package setup
;; -------------

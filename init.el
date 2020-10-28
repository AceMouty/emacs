
;; ===========================================
;; Basic UI config
;; ===========================================

(scroll-bar-mode -1)     ; Disable Scroll Bar
(show-paren-mode 1)      ; Highlight Matching Paren's
(tool-bar-mode -1)      ; Disable Tool Bar
(tooltip-mode -1)        ; Disable Tooltip
(menu-bar-mode -1)      ; Disable Menubar
(blink-cursor-mode 0)                   ;; disable blinking cursor to prevent mental trauma
(global-auto-revert-mode 1)             ;; reload files that change on disk
(set-fringe-mode 10)     ; Give some spacing
(global-hl-line-mode +1) ; Shadow the current line
(setq visable-bell t)    ; Enable Visual Bell
(setq scroll-conservatively 100)
;(setq inhibit-startup-message t) ; Disable Default Menu

;; Set Font
(set-face-attribute 'default nil :font "SauceCodePro Nerd Font" :height 130)

;; Line Numbers and Column Numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
(add-hook mode (lambda () (display-line-numbers-mode 0))))

;; ===========================================
;; Custom Keys
;; ===========================================

;; Set Esc to quit out of a key bind
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Change Buffer
(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

;; ===========================================
;; Packages and Sources setup
;; ===========================================

;; Init Package Resources
(require 'package)

;; Set packages sources if installing config on new machine / install
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Install use package if its not already installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Command logger good for screen casts
(use-package command-log-mode) ;; <- Install a package using use-package

;; LOAD CONFIG FROM ORG FILE
(org-babel-load-file (expand-file-name "~/.config/emacs/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0)
 '(counsel-describe-function-function 'helpful-callable)
 '(counsel-describe-variable-function 'helpful-variable)
 '(custom-safe-themes
   '("730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" default))
 '(package-selected-packages
   '(lsp-ivy lsp-ui company-lsp lsp-mode impatient-mode general evil-tutor company-box flycheck rjsx-mode company counsel-projectile projectile doom-themes helpful ivy-rich which-key evil-collection evil dashboard page-break-lines rainbow-delimiters doom-modeline counsel ivy use-package command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

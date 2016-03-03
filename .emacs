(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'fill-column-indicator)
(tool-bar-mode -1)

;; ========== FONT ==========
;; (global-visual-line-mode t)
;; (set-default-font "DejaVu Sans Mono Bold")
(setq-default indent-line-function 4)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default lisp-indent-offset 4)
(setq-default sgml-basic-offset 4)
(setq-default nxml-child-indent 4)
(setq tab-stop-list (number-sequence 4 200 4))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
	'(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal
					  :weight bold :height 120 :width normal)))))


;; ========== THEMES ==========
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)
;;(set-frame-parameter nil 'background-mode 'dark)
;;(enable-theme 'solarized)

;; Add melpa package
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(ac-config-default)

;; ctrl-c ctrl-v
(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1)               ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy t) 

;; cursor
(setq-default cursor-type 'bar) 

;; ===== Set the highlight current line minor mode ===== 

;; In every buffer, the line which contains the cursor will be fully
;; highlighted

;;(global-hl-line-mode 1)

;; ========== Support Wheel Mouse Scrolling ==========

(mouse-wheel-mode t)

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Show column-number on left
(global-linum-mode t)

;; ============== Enable 80 column marker ===============
(define-globalized-minor-mode my-global-fci-mode fci-mode turn-on-fci-mode)
(my-global-fci-mode 1)
(setq fci-rule-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "red")

;; ============== Hide welcome panel ===============
(setq inhibit-startup-message t)

;; ============== Delete white space at EOL ===============
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

;; ============== More colors ===============
(global-font-lock-mode t)
(setq font-lock-maximum-size nil)

;; ============== Match brackets and all ===============
(load-library "paren")
(show-paren-mode 1)

;; ============== Transparent ===============
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;; (set-frame-parameter (selected-frame) 'alpha '(85 50))
;; (add-to-list 'default-frame-alist '(alpha 85 50))



;; ============== WEB ===============
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
	(setq web-mode-markup-indent-offset 2)
	(setq web-mode-css-indent-offset 2)
	(setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


;; ============== TAB BAR MODE ===============

(require 'tabbar)
; turn on the tabbar
(tabbar-mode t)
; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;“User Buffer”.

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    ))) 

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

 (global-set-key [M-left] 'tabbar-backward-tab)
 (global-set-key [M-right] 'tabbar-forward-tab)

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "atwist227"
      user-mail-address "atwist227@github.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; Setting English Font
(set-face-attribute
 'default nil
 :font (font-spec :family "Source Code Pro"
                  :size 14))
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :family "PingFang SC"
              :size 14)))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Seafile/Private/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; org-mode 项目列表图标（需要+pretty）
(setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))
(setq org-M-RET-may-split-line '((default . t)))


;; 设置启动窗口宽和高
;; (set-frame-width (selected-frame) 87)
;; (set-frame-height (selected-frame) 37)

;; latex相关设置
;; 参考文献路径
(setq reftex-default-bibliography "~/Documents/BooksAndPapers/Papers/MyBib.bib")
;; 启用cdlatex tab扩展
(map! :map cdlatex-mode-map
    :i "TAB" #'cdlatex-tab)

;; (setq-default TeX-master nil);;用于处理多文档的tex文件

;; (mapc (lambda (mode)
;;         (add-hook 'LaTeX-mode-hook mode))
;;       (list 'turn-on-cdlatex
;;             'reftex-mode
;;             'outline-minor-mode
;;             'auto-fill-mode
;;             'flyspell-mode
;;             'hide-body t
;;             ))

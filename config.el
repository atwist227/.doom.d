;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;===========
;;;== Basic ==
;;;===========
;; credentials
(setq user-full-name "atwist227"
      user-mail-address "atwist227@github.com")

;;autosave and backup
(setq auto-save-default t
      make-backup-files t)

;; kill emacs without confirming
(setq confirm-kill-emacs nil)

;;;============
;;;== Visual ==
;;;============
;; Theme & Fonts
(setq doom-theme 'doom-one)

(if (featurep :system 'gun/linux)
    (setq doom-font (font-spec :family "JetBrainsMono NF" :size 13.0 :weight 'light)
          doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 14.0)
          doom-symbol-font (font-spec :family "JuliaMono")
          doom-big-font (font-spec :family "JetBrainsMono NF" :size 24.0)))

;; display line number
(setq display-line-numbers-type t)


;;;==================
;;;== Doom Modules ==
;;;==================

;;; == :editor ==
;; evil
(after! evil
  (setq evil-move-cursor-back nil     ; don't move the block cursor when toggling insert mode
        evil-kill-on-visual-paste nil ; don't put overwritten text in the kill ring
        evil-want-fine-undo t
        evil-move-beyond-eol t
        ;; evil-want-minibuffer t
        +evil-want-o/O-to-continue-comments nil))

;;; == :lang ==
;; latex
(after! tex
  ;; 启用 pdf-tools 显示 PDF
  (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

  ;; .bib location
  (setq reftex-default-bibliography "~/Seafile/THU研究生/Notes_latex/ref.bib")

  (setq TeX-electric-sub-and-superscript t)
  )

(after! cdlatex
  (map! :map cdlatex-mode-map
        :i "TAB" #'cdlatex-tab)

  (setq cdlatex-math-modify-alist
        '((?b "\\mathbb" nil t nil nil)
          (?k "\\mathfrak" nil t nil nil)
          (?m "\\mathrm" nil t nil nil)
          (?o "\\operatorname" nil t nil nil)
          )
        cdlatex-math-symbol-alist
        '((?e ("\\varepsilon" "\\epsilon"))
          (?f ("\\varphi" "\\phi"))
          (?0 ("\\varnothing" "\\emptyset"))
          )
       ;; cdlatex-command-alist ;; expand with <TAB>
       ;; '(("eqn" "Insert an EQUATION* environment template" "" cdlatex-environment ("equation*") t nil)
       ;;   ("aln" "Insert an ALIGN* environment template" "" cdlatex-environment ("align*") t nil)
       ;;   ("op" "Insert \\operatorname{}()" "\\operatorname{?}()" cdlatex-position-cursor nil nil t))))
        )
  )

;; org
(setq org-directory "~/org/")


;;;===================
;;;== Other Modules ==
;;;===================

;;== smart-input-source
(use-package sis
  ;; :hook
  ;; enable the /context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))

  :config
  (if (featurep :system 'darwin)
    (sis-ism-lazyman-config
     ;; English input source
     "com.apple.keylayout.US"
     ;; Other language input source
     "com.sogou.inputmethod.sogou.pinyin"))

  (if (featurep :system 'gun/linux)
    (sis-ism-lazyman-config "1" "2" 'fcitx5))

  ;; --- Global settings that apply to all OSes ---
  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t))

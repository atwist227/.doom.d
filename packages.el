;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; Chinese input support
(if (eq system-type 'gnu/linux)
    (progn
      (package! rime)
      (package! posframe)))

(if (eq system-type 'windows-nt)
    (package! sis))

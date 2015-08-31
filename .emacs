;;加载初始化文件
(load "~/.emacs.d/lisp/init.el")

;;color-theme主题包
(add-to-list 'load-path "~/.emacs.d/theme/")
;;(require 'color-theme)
;;(color-theme-initialize)

;;solarized主题
(add-to-list 'load-path "~/.emacs.d/theme/solarized/")
(require 'color-theme-solarized)
(color-theme-solarized-dark)

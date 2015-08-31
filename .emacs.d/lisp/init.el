;;不显示工具栏
(tool-bar-mode 0)

;;不显示菜单栏
(menu-bar-mode 0)

;;不显示滚动条
(scroll-bar-mode 0)

;;显示行号与列号
(global-linum-mode 1)
(column-number-mode 1)

;;设置问答提示为 y-or-n,而不是yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;;不生成备份文件，即 xxx.xx~ 类文件
(setq make-backup-files nil)

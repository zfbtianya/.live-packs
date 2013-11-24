;;; hippie-expand补全
(setq hippie-expand-try-functions-list
      '(try-expand-line
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-list
        try-expand-list-all-buffers
        try-expand-line-all-buffers
        try-expand-whoe-kill
        ))

;; Ellen Taylor provided the following code, which makes shell command always start a new shell.
(defadvice shell (around always-new-shell)
  "Always start a new shell."
  (let ((buffer (generate-new-buffer "*shell*"))) ad-do-it))
(ad-activate 'shell)

;;设置默认打开摸式为 Text-mode
(setq major-mode 'text-mode)

;;; 设置标题栏显示文件的完整路径名
(defun frame-title-string ()
  "Return the file name of current buffer, using ~ if under home directory"
  (let
      ((fname (or
               (buffer-file-name (current-buffer))
               (buffer-name))))
    ;; let body
    (when (string-match (getenv "HOME") fname)
      (setq fname (replace-match "~" t t fname)))
    fname
    ))
(setq frame-title-format '("Emacs@" system-name ": " (:eval (frame-title-string))))

(setq echo-keystrokes 0.1)              ;尽快显示按键序列提示
;; (global-hl-line-mode 1)                 ;高亮显示当前行
(setq kill-ring-max 200)                ;设定删除保存记录为200，可以方便以后无限恢复
                                        ;(setq x-select-enable-clipboard t)      ;允许emacs和外部其他程序的粘贴, (message (format "%s"  x-select-enable-clipboard))

;;; 为什么使用语法显示的大文件在移动时如此之慢
(setq major-mode 'text-mode)    ;设置默认地主模式为TEXT模式
(setq x-stretch-cursor t)               ;光标在 TAB 字符上会显示为一个大方块

;;; 显示菜单栏
;; (menu-bar-mode 1)

;;自动注释/反注释单行单行代码,如果选中区域,就注释/反注释区域
(defun comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key (kbd "M-;") 'comment-dwim-line)

;;; 设置窗口半透明
(setq alpha-list '((73 50) (100 100))) ;;当前窗口和非当前窗口时透明度分别为85、50
(global-set-key [f12] 'loop-alpha) ;;全局绑定F12键为Emacs半透明功能键
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
     (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))

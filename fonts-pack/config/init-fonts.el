;; Chinese Font <2013-11-17 Sun> by zengfb at Shanghai Hesha road
(setq window-system-default-frame-alist
      '(
        ;; if frame created on x display
        (x
         ;; mouse
         ;; (mouse-wheel-mode . 1)
         ;; (mouse-wheel-follow-mouse . t)
         ;; (mouse-avoidance-mode . 'exile)
         ;; face
         (font . "文泉驿等宽微米黑")
         )
        ;; if on term
        (nil
         (menu-bar-lines . 0) (tool-bar-lines . 0)
         )
        )
      )

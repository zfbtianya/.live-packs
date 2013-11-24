;; (setq el-get-dir "~/.emacs.d/el-get/")
(setq el-get-dir "/home/zengfb/.live-packs/el_get-pack/lib/")
(live-add-pack-lib "el-get")
(require 'el-get)
;;; install el-get
;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))

(el-get 'sync)

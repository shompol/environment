
(put 'downcase-region 'disabled nil)

;(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-splash-screen t)


;;(load "/usr/share/emacs/site-lisp/flyparse-mode/flyparse-mode.el")
;;(require 'flyparse-mode)

(set-face-background 'default "#000000")
(set-face-foreground 'default "#cfcfcf")

;;Anonymous Pro Regular
(set-frame-font    "-unknown-Anonymous Pro-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")


;;); 
 
;;(set-fill-column 72)))


(if (and (not window-system)
          (string-match "^xterm" (getenv "TERM")))
     (progn
       (require 'xterm-frobs)
       (defun my-xterm-title-hook ()
         (xterm-set-window-title
          (concat
           (cond (buffer-read-only "%  ")
                 ((buffer-modified-p) "*  "))
           (buffer-name)
           "  (" invocation-name "@" system-name ")")))
       (add-hook 'post-command-hook  'my-xterm-title-hook))
     (setq frame-title-format
           '(""
             (:eval (cond (buffer-read-only "%%  ")
                          ((buffer-modified-p) "*  ")))
             "%b  (" invocation-name "@" system-name ")")))



;; need this for C-x C-m f unicode changes
;;(global-set-key "\C-x\C-m" 'compile)
(global-set-key "\M-g" 'goto-line)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(custom-set-variables
'(inhibit-startup-screen t))

;; open ediff control window in a frame
(ediff-toggle-multiframe)



(setq-default c-basic-offset 4)
(setq c-default-style "linux"
      c-basic-offset 4)

    (setq-default c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode nil)


 ;; if indent-tabs-mode is off, untabify before saving
 (add-hook 'write-file-hooks 
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))
                      nil ))



;(setq x-select-enable-clipboard t)


;; Directory to put various el files.
(add-to-list 'load-path "~/.emacs.d/includes")
(require 'asp-mode)

;; ASP mode
    (autoload 'asp-mode "asp-mode")
    (setq auto-mode-alist 
       (cons '("\\.asp\\'" . asp-mode) auto-mode-alist))

;; Show buffer in title -- already done!!!!
;;  (setq frame-title-format
;;          '("%f" (dired-directory dired-directory "%b")))


;(setq x-select-enable-clipboard t)
;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)




;   (setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
;   (setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection
;   (setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection


(setq mouse-drag-copy-region t)    ;Select = copy to kill ring, but paste from Windows is still only C-y

;; THIS WAS CRASHING AND IS THEREFORE DISABLED
;; unload python.el to clear way for python-mode.el
;(when (featurep 'python) (unload-feature 'python t))
;;python-mode.el-6.1.3
;(add-to-list 'load-path "~/.emacs.d/includes/python-mode.el-6.1.3")
;(setq py-install-directory "c:\\python")
;(require 'python-mode)
;;(setq py-shell-name "MY-PYTHON")
;(setq py-shell-name "c:\\python\\python")


;; Usage: emacs -diff file1 file2
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))
(add-to-list 'command-switch-alist '("diff" . command-line-diff))
    

;; disable vc-git to fix difftool issue
(setq vc-handled-backends ())

;(require 'package)
;(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)
(elpy-enable)
(add-hook 'elpy-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'delete-trailing-whitespace nil t)))

(add-to-list 'load-path "~/.emacs.d/includes")
(require 'asp-mode)

(add-to-list 'load-path "~/.emacs.d/includes/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

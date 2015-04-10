;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

(defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
  "The storage location for various persistent files.")

(add-to-list 'default-frame-alist '(width . 180)) ; character
(add-to-list 'default-frame-alist '(height . 52)) ; lines

;PROBABLY REMOVE?
(add-to-list 'package-archives  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives  '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))

;SMARTPARENS
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/smartparens")
(require 'smartparens-config)

;EXPECTATIONS
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/expectations-mode")
(require 'expectations-mode)
;; (autoload 'dirtree "dirtree" "Add directory to tree view" t)

;LESS CSS
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/less-css-mode")
(require 'less-css-mode)

;Wombat Color Themex
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/color-theme-wombat")
(require 'color-theme-wombat)

;NEO-TREE
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/emacs-neotree")
(require 'neotree)
;(setq projectile-switch-project-action 'neotree-projectile-action)
(global-set-key [f8] 'neotree-toggle)


;PROJECT EXPLORER
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/es-windows")
(require 'es-windows)
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/es-lib")
(require 'es-lib)
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/project-explorer")
(require 'project-explorer)
(setq pe/cache-directory (concat dotemacs-cache-directory "project-explorer"))
(setq pe/omit-regex (concat pe/omit-regex "\\|^node_modules$" "\\|^bower-components$"))

(global-set-key [f9] 'project-explorer-toggle)




;DOCKERFILE
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/dockerfile-mode")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;GOLANG
;(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/go-mode")
;(require 'go-mode)
;;(setenv "PATH" "/Users/tleyden/.rbenv/shims:/Users/tleyden/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/go/bin")
;;(setenv "GOPATH" "/Users/tleyden/Development/gocode")
;;(setq exec-path (cons "/usr/local/go/bin" exec-path))
;;(add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")
;;(add-hook 'before-save-hook 'gofmt-before-save)

;;(setq py-install-directory "~/.live-packs/emacs-live-pack/config/pdee/")
;;(add-to-list 'load-path py-install-directory)
;;(require 'python-mode)

;;(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/emacs-ansible")
;;(require 'ansible)

(yas-load-directory "~/.live-packs/emacs-live-pack/yasnippet")

(setq make-backup-files nil)

;(load-file "config/emmet-mode/emmet-mode.el")
;(require 'emmet-mode)

;; Load binings config
(live-load-config-file "bindings.el")
(live-load-config-file "slamhound.el")
(live-load-config-file "kibit.el")
(live-load-config-file "emmet-mode.el")

(defun --running-as-server ()
    "Returns true if `server-start' has been called."
  (condition-case nil
      (and (boundp 'server-process)
           (memq (process-status server-process)
                 '(connect listen open run)))
    (error)))


(setq javascript-indent-level 2)

(setq project-roots
        '(("Blog" :root-contains-files ("index.muse" "images" "content"))
          ("Generic Perl Project" :root-contains-files ("t" "lib"))))

;; (live-load-config-file "snake-camel-kebab.el")

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(add-hook 'sgml-mode-hook 'smartparens-mode)
(add-hook 'js2-mode-hook 'smartparens-mode)

(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t))

(global-auto-revert-mode t)

;; Append result of evaluating previous expression (Clojure):
(defun cider-eval-last-sexp-and-append ()
  "Evaluate the expression preceding point and append result."
  (interactive)
  (let ((last-sexp (cider-last-sexp)))
    ;; we have to be sure the evaluation won't result in an error
    (cider-eval-and-get-value last-sexp)
    (with-current-buffer (current-buffer)
      (insert ";;=>"))
    (cider-interactive-eval-print last-sexp)))

(defun top-join-line ()
  "Join the current line with the line beneath it."
  (interactive)
  (delete-indentation 1))

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

(global-set-key (kbd "C-M-d") 'duplicate-line)


 (defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))

(global-set-key (kbd "M-i") 'ido-goto-symbol)

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

;CLJ-REFACTOR
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/clj-refactor.el")
(require 'clj-refactor)
(defun my-clj-refactor-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clj-refactor-mode-hook)
(add-hook 'clojure-mode-hook 'linum-mode)

;;BOOT SUPPORT
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

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

;Noctilux Color Themex
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/noctilux-theme")
(add-to-list 'custom-theme-load-path "~/.live-packs/emacs-live-pack/config/noctilux-theme")
(require 'noctilux-theme)
(load-theme 'noctilux t)

;;(global-linum-mode t)

;;PROJECTILE & PERSPECTIVE
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/projectile")
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'Native)
(setq projectile-enable-caching t)

;;FLX TO HELP IDO WITH PROJECTILE

(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/flx")
(require 'flx)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/perspective-el")
(require 'perspective)
(persp-mode)
(require 'persp-projectile)
(provide 'init-persp-mode)

;(setq ido-use-virtual-buffers t)

;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;(require 'rainbow-delimiters)
;; (set-face-attribute 'rainbow-delimiters-unmatched-face nil
;;                     :foreground 'unspecified
;;                     :inherit 'error)


(defun noprompt/forward-transpose-sexps ()
  (interactive)
  (paredit-forward)
  (transpose-sexps 1)
  (paredit-backward))

(defun noprompt/backward-transpose-sexps ()
  (interactive)
  (transpose-sexps 1)
  (paredit-backward)
  (paredit-backward))

(key-chord-define-global "tk" 'noprompt/forward-transpose-sexps)
(key-chord-define-global "tj" 'noprompt/backward-transpose-sexps)

(key-chord-define-global "rg" 'rgrep)

(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;;(set-frame-font "Source Code Pro-16" nil t)

(defun cider-eval-expression-at-point-in-repl ()
  (interactive)
  (let ((form (cider-defun-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
           (setq form (replace-match "" t t form)))
    (set-buffer (cider-get-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))

(require 'cider-mode)
(define-key cider-mode-map
            (kbd "C-;") 'cider-eval-expression-at-point-in-repl)

(require 'cl)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
           (flet ((process-list ())) ad-do-it))

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

;;WORKGROUPS
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/workgroups.el")
(require 'workgroups)
(workgroups-mode 1)


;DOCKERFILE
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/dockerfile-mode")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


;GO-LANG MODE
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/go-mode.el")
(require 'go-mode)


(defun make-it-go ()
  (setq exec-path (cons "/usr/local/bin/go" exec-path))
  (add-to-list 'exec-path "~/Development/go/bin")
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")))

(add-hook 'go-mode-hook 'make-it-go)

;GROOVY MODE
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/groovy-emacs-modes")
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/emacs-gradle-mode")
(require 'groovy-mode)
(require 'gradle-mode)
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))

;;COFFEE SCRIPT
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/coffee-mode")
(require 'coffee-mode)



;;COMPANY MODE
(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/company-mode")
(require 'company)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.1)

(add-hook 'after-init-hook 'global-company-mode)
""
(setq company-backends '((company-files)))

(define-key global-map (kbd "M-?") 'company-files)


(defun my-run-in-nrepl (str)
  "Run a string in the repl by executing it in the current buffer.
  If output in the mini-buffer is ok use nrepl-interactive-eval instead"
  (interactive)
  (with-current-buffer (get-buffer (cider-current-repl-buffer))
    (goto-char (point-max))
    (insert str)
    (cider-repl-return)))

(defun my-figwheel-repl ()
  (interactive)
  (cider-connect "localhost" 7888)
  (my-run-in-nrepl
   (format "%s"
       '(do
        (require '[figwheel-sidecar.repl-api :refer :all])
        (cljs-repl)))))

(defun reloaded-reset ()
  (interactive)
  (my-run-in-nrepl
   (format "%s"
           '(user/reset))))
(defun reloaded-go ()
  (interactive)
  (my-run-in-nrepl
   (format "%s"
       '(user/reset))))


;;(setq py-install-directory "~/.live-packs/emacs-live-pack/config/pdee/")
;;(add-to-list 'load-path py-install-directory)
;;(require 'python-mode)

;;(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/emacs-ansible")
;;(require 'ansible)

(yas-load-directory "~/.live-packs/emacs-live-pack/yasnippet")

(setq make-backup-files nil)

;(load-file "config/emmet-mode/emmet-mode.el")
;(require 'emmet-mode)

(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/hydra")
(require 'hydra)

;; Load binings config
(live-load-config-file "bindings.el")
(live-load-config-file "slamhound.el")
(live-load-config-file "kibit.el")
(live-load-config-file "emmet-mode.el")

(live-load-config-file "hydra-cljr.el")
(live-load-config-file "hydra-rectangle.el")
(live-load-config-file "hydra-windows.el")

(global-set-key "\M-[1;5C"    'forward-char)  ; Ctrl+right   => forward word
(global-set-key "\M-[1;5D"    'backward-char)
(global-set-key "\M-[1;5A"    'previous-line)
(global-set-key "\M-[1;5B"    'next-line)

(defun --running-as-server ()
    "Returns true if `server-start' has been called."
  (condition-case nil
      (and (boundp 'server-process)
           (memq (process-status server-process)
                 '(connect listen open run)))
    (error)))


(setq javascript-indent-level 2)
(setq css-indent-offset 2)

(setq project-roots
        '(("Blog" :root-contains-files ("index.muse" "images" "content"))
          ("Generic Perl Project" :root-contains-files ("t" "lib"))))

;; (live-load-config-file "snake-camel-kebab.el")

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(add-hook 'sgml-mode-hook 'smartparens-mode)
(add-hook 'js2-mode-hook 'smartparens-mode)

(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/emacs-git-gutter")
(require 'git-gutter)
;;(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/git-gutter-plus")
;;(add-to-list 'load-path "~/.live-packs/emacs-live-pack/config/git-gutter-fringe-plus")
;;(require 'git-gutter+)
;;(require 'git-gutter-fringe+)


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


(defun move-line-up ()
  (interactive)
  (setq col (current-column))
  (transpose-lines 1)
  (forward-line -2)
  (forward-char col))


(defun move-line-down ()
  (interactive)
  (setq col (current-column))
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (forward-char col))

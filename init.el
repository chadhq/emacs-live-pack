;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.


(add-to-list 'package-archives  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives  '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'load-path "config/dirtree")
(autoload 'dirtree "dirtree" "Add directory to tree view" t)

(yas-load-directory "/Users/chadharris/.live-packs/chadharris-pack/yasnippet")

;(load-file "config/emmet-mode/emmet-mode.el")
;(require 'emmet-mode)

;; (defun minibuffer-size-normal ()
;;        (set (make-local-variable 'face-remapping-alist)
;;           '((default :height 1.0))))

(add-to-list 'default-frame-alist '(width . 180)) ; character
(add-to-list 'default-frame-alist '(height . 52)) ; lines

;; Load binings config
(live-load-config-file "bindings.el")
(live-load-config-file "slamhound.el")
(live-load-config-file "kibit.el")
(live-load-config-file "emmet-mode.el")


 (setq project-roots
        '(("Blog" :root-contains-files ("index.muse" "images" "content"))
          ("Generic Perl Project" :root-contains-files ("t" "lib"))))



;; (live-load-config-file "snake-camel-kebab.el")

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

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

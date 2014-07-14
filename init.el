;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.


(add-to-list 'package-archives  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives  '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))


;(require 'dirtree)

;;(live-load-config-file "slamhound.el")

;; Load bindings config
(live-load-config-file "bindings.el")
(define-key clojure-mode-map (kbd "s-i") 'cider-eval-last-sexp)
(define-key clojure-mode-map (kbd "s-I")  'cider-eval-last-sexp-and-append)
(global-set-key (kbd "C-^") 'top-join-line)

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

 ;; (defhydra hydra-debug (:body-pre (cider-debug-defun-at-point)
;;                         :color pink
;;                         :post (cider-debug-mode-send-reply ":quit"))
;;   "debug
;; "

;;   ("n" (cider-debug-mode-send-reply ":next") "Next step")
;;   ("c" (cider-debug-mode-send-reply ":continue")"Continue without stopping")
;;   ("o" (cider-debug-mode-send-reply ":out")"Move out of the current sexp (like up-list)")
;;   ("i" (cider-debug-mode-send-reply ":inject")"Inject a value into running code")
;;   ("I" (cider-debug-mode-send-reply ":inspect")"Eval code in current context")
;;   ("l" (cider-debug-mode-send-reply ":locals")"Inspect local variables")


;;   ("q" nil :exit truex))

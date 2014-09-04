;; Place your bindings here.

;; For example:
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-_") 'snakecase-region)

(define-key clojure-mode-map (kbd "C-c M-j") 'cider-jack-in)
(define-key clojure-mode-map (kbd "C-c M-J") 'cider-restart)

(define-key paredit-mode-map [s-down] 'paredit-forward-down)
(define-key paredit-mode-map [s-right] 'paredit-forward-up)
(define-key paredit-mode-map [s-left] 'paredit-backward-down)
(define-key paredit-mode-map [s-up] 'paredit-backward-up)

(define-key paredit-mode-map (kbd "s-<") 'backward-sexp)
(define-key paredit-mode-map (kbd "s->") 'forward-sexp)

(global-set-key [M-s-up] 'windmove-up)
(global-set-key [M-s-down] 'windmove-down)
(global-set-key [M-s-left] 'windmove-left)
(global-set-key [M-s-right] 'windmove-right)

(global-set-key (kbd "C-M-<") 'shrink-window-horizontally)
(global-set-key (kbd "C-M->") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-\"") 'shrink-window)

(global-set-key (kbd "C-M-:") 'enlarge-window)
(global-set-key (kbd "C-c r m") 'set-rectangular-region-anchor)

(global-set-key [M-left] 'previous-buffer)
(global-set-key [M-right] 'next-buffer)

(define-key clojure-mode-map (kbd "s-i") 'cider-eval-last-sexp)
(define-key clojure-mode-map (kbd "s-I")  'cider-eval-last-sexp-and-append)

(global-set-key (kbd "C-^") 'top-join-line)


(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(global-set-key (kbd "M-s-d") 'duplicate-line)

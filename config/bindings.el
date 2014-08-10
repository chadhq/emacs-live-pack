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

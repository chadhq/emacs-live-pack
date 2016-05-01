(defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
                                      :hint nil
                                      :color blue)
  "
Git gutter:
  _g_ ^ ^: Magit!
  _j_ _n_: next hunk        _s_tage hunk       _q_uit
  _k_ _p_: previous hunk    _r_evert hunk      _Q_uit and deactivate git-gutter
  ^ ^ ^ ^                   _p_opup hunk diff
  _h_ _f_: first hunk
  _l_ ^ ^: last hunk        set start _R_evision
"
  ("g" magit)
  ("j" git-gutter:next-hunk)
  ("n" git-gutter:next-hunk)
  ("k" git-gutter:previous-hunk)
  ("p" git-gutter:previous-hunk)
  ("h" (progn (goto-char (point-min))
              (git-gutter:next-hunk 1)))
  ("f" (progn (goto-char (point-min))
              (git-gutter:next-hunk 1)))
  ("l" (progn (goto-char (point-min))
              (git-gutter:previous-hunk 1)))
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("p" git-gutter:popup-hunk)
  ("R" git-gutter:set-start-revision)
  ("q" nil :color red)
  ("Q" (progn (git-gutter-mode -1)
              ;; git-gutter-fringe doesn't seem to
              ;; clear the markup right away
              (sit-for 0.1)
              (git-gutter:clear))
   :color blue))

(global-set-key (kbd "C-c g") 'hydra-git-gutter/body)

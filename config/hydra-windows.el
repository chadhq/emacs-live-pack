(defun shrink-more (arg)
  "Move window splitter up."
  (interactive "p")
  (shrink-window 5))

(defhydra hydra-window (:color pink :hint nil)
  "
    Move Windows         Buffers               ^Move Frames               ^^Resize Frames
    -------------------------------------------------------------------------------------
                         _b_uffer Ido            _<up>_    Move up           _C-<up>_    Shrink V.
          ↑              _f_ind file Ido         _<down>_  Move down         _C-<down>_  Grow V.
        ←   →            _r_ecent Ido            _<left>_  Move left         _C-<left>_  Shrink H.
          ↓              _B_uffer Helm           _<right>_ Move right        _C-<right>_ Grow H.
                         _F_ind file Helm        _o_       Rotate            _=_         Balance
                         _R_recent Helm

                         _c_ider REPL

  ^_0_^ Close   _1_ Keep   _2_ Split V   _3_ Split H   _n_ Other Window   _q_ quit
"
  ("0" delete-window)
  ("1" delete-other-windows)
  ("2" split-window-below)
  ("3" split-window-right)
  ("n" other-window true)
  ("c" cider-popup :exit true)
  ("C-S-<up>" shink-more)
  ("C-<up>" shrink-window)
  ("C-<down>" enlarge-window)
  ("C-<left>" shrink-window-horizontally)
  ("C-<right>" enlarge-window-horizontally)
  ("<up>" windmove-up)
  ("<down>" windmove-down)
  ("<left>" windmove-left)
  ("<right>" windmove-right)
  ("C-n" windmove-down)
  ("C-p" windmove-up)
  ("C-f" windmove-right)
  ("C-b" windmove-left)
  ("=" balance-windows)
  ("o" rotate-windows)
  ("r" helm-projectile-recentf)
  ("R" ido-recentf-open)
  ("b" helm-projectile-switch-to-buffer)
  ("B" ido-switch-buffer)
  ("f" helm-projectile-find-file)
  ("F" ido-find-file)
  ("q" nil :exit truex))

(key-chord-define-global
 "ww"
 'hydra-window/body)

(global-set-key (kbd "C-x w") 'hydra-window/body)

(defhydra hydra-projectile (:color blue :hint nil :idle 0.4)
        "

                                                                                                                          ╭────────────┐                   ╭────────┐
   Files             Search          Buffer             Do                Other Window      Run             Cache         │ Projectile │                   │ Fixmee │
 ╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┴────────────╯  ╭────────────────┴────────╯
   [_f_] file (Helm)   [_a_] ag          [_b_] switch (Helm)  [_g_] magit         [_F_] file          [_U_] test        [_kc_] clear         [_x_] TODO & FIXME
   [_l_] file dwim     [_A_] grep        [_v_] show all       [_P_] commander     [_L_] dwim          [_m_] compile     [_kk_] add current   [_X_] toggle
   [_r_] recent file   [_s_] occur       [_V_] ibuffer        [_i_] info          [_D_] dir           [_c_] shell       [_ks_] cleanup
   [_d_] dir           [_S_] replace     [_K_] kill all        ^ ^                [_O_] other         [_C_] command     [_kd_] remove
    ^ ^                 ^ ^               ^ ^                  ^ ^                [_B_] buffer
   [_p_] Switch Project
  --------------------------------------------------------------------------------
        "
        ("<tab>" hydra-master/body "back")
        ("<ESC>" nil "quit")
        ("a"   helm-projectile-ag)
        ("A"   projectile-grep)
        ("B"   projectile-switch-to-buffer)
        ("b"   helm-projectile-switch-to-buffer)
        ("c"   projectile-run-async-shell-command-in-root)
        ("C"   projectile-run-command-in-root)
        ("d"   projectile-find-dir)
        ("D"   projectile-find-dir-other-window)
        ("f"   helm-projectile-find-file)
        ("F"   projectile-find-file)
        ("g"   projectile-vc)
        ("h"   projectile-dired)
        ("i"   projectile-project-info)
        ("kc"  projectile-invalidate-cache)
        ("kd"  projectile-remove-known-project)
        ("kk"  projectile-cache-current-file)
        ("p"   helm-projectile-switch-project)
        ("P"   projectile-switch-project)
        ("K"   projectile-kill-buffers)
        ("ks"  projectile-cleanup-known-projects)
        ("l"   projectile-find-file-dwim)
        ("L"   projectile-find-file-dwim-other-window)
        ("m"   projectile-compile-project)
        ("o"   projectile-find-other-file)
        ("O"   projectile-find-other-file-other-window)
        ("r"   helm-projectile-recentf)
        ("R"   projectile-recentf)
        ("s"   projectile-multi-occur)
        ("S"   projectile-replace)
        ("t"   projectile-find-tag)
        ("T"   projectile-regenerate-tags)
        ("u"   projectile-find-test-file)
        ("U"   projectile-test-project)
        ("v"   projectile-display-buffer)
        ("V"   projectile-ibuffer)
        ("X"   fixmee-mode)
        ("x"   fixmee-view-listing))

(global-set-key (kbd "C-x p") 'hydra-projectile/body)
(key-chord-define-global "[p" 'hydra-projectile/body)

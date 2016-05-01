 (defhydra hydra-cider (:color pink :hint nil)
   "
     ^^nRepl
    ------------------------
    _nc_   nREPL Connect
    _nh_   Current nREPL Host
    _nb_   nREPL Conection Browser

    _q_ quit
"
    ("nc" nrepl-connect "nREPL Connect")
    ("nh" nrepl-current-host "Current nREPL host")
    ("nb" nrepl-connection-browser)


   ("q" nil :exit truex))

(global-set-key (kbd "C-c C-d") 'hydra-cider/body)

;; (key-chord-define-global
;;  "rr"
;;  'hydra-cljr/body)

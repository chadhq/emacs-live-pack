 (defhydra hydra-cljr (:color pink :hint nil)
    "
    Fns & General                        ^^NS / Import                   ^^Project                               ^^Let
    ------------------------------------------------------------------------------------------------------------------------------------
    _pf_   Promote function                _am_  Add missing libspec       _pc_   Project clean                     _il_   Introduce let
    _cp_   Cycle privacy                   _cn_  Clean ns                  _hd_   Hotload dependency                _el_   Expand let
    _fe_   Create function from example    _sr_  Stop referring            _sp_   Sort project dependencies         _rl_   Remove let
    _cs_   Change function signature       _ru_  Replace use               _ap_   Add project dependency            _ml_   Move to let
    _dk_   Destructure keys                _ai_  Add import to ns          _sc_   Show the project's changelog
    _ec_   Extract constant                _au_  Add use to ns             _up_   Update project dependencies       ^Threading
    _ef_   Extract function                _ar_  Add require to ns         _ad_   Add declaration                   ------------------------
    _fu_   Find usages                     _sn_  Sort ns                                                      ^^    _th_   Thread
    _is_   Inline symbol                   _rr_  Remove unused requires                                       ^^    _tf_   Thread first all
    _mf_   Move form to ns                                                                                    ^^^^  _tl_   Thread last all
    _rf_   Rename file-or-dir                                                                                 ^^^^  _ua_   Unwind all
    _rs_   Rename symbol                                                                                      ^^^^  _uw_   Unwind
                                                                                                              ^^^^^^_ct_   Cycle thread

     _as_   Add stubs for the interface / protocol at point.      _cc_   Cycle coll
     _rd_   Remove debug fns                                      _ci_   Cycle if

     _q_ quit
"
   ("ai" cljr-add-import-to-ns "Add import to ns")
   ("am" cljr-add-missing-libspec "Add missing libspec")
   ("ap" cljr-add-project-dependency "Add project dependency")
   ("ar" cljr-add-require-to-ns "Add require to ns")
   ("as" cljr-add-stubs "Add stubs for the interface / protocol at point.")
   ("au" cljr-add-use-to-ns "Add use to ns")
   ("cc" cljr-cycle-coll "Cycle coll")
   ("ci" cljr-cycle-if "Cycle if")
   ("cn" cljr-clean-ns "Clean ns")
   ("cp" cljr-cycle-privacy "Cycle privacy")
   ("cs" cljr-change-function-signature "Change function signature")
   ("ct" cljr-cycle-thread "Cycle thread")
   ("dk" cljr-destructure-keys "Destructure keys")
   ("ec" cljr-extract-constant "Extract constant")
   ("ef" cljr-extract-function "Extract function")
   ("el" cljr-expand-let "Expand let");
   ("fe" cljr-create-fn-from-example "Create function from example")
   ("fu" cljr-find-usages "Find usages")
   ("hd" cljr-hotload-dependency "Hotload dependency" :exit t)
   ("il" cljr-introduce-let "Introduce let");
   ("is" cljr-inline-symbol "Inline symbol")
   ("mf" cljr-move-form "Move form")
   ("ml" cljr-move-to-let "Move to let");
   ("pc" cljr-project-clean "Project clean")
   ("pf" cljr-promote-function "Promote function")
   ("rd" cljr-remove-debug-fns "Remove debug fns")
   ("rf" cljr-rename-file-or-dir "Rename file-or-dir")
   ("rl" cljr-remove-let "Remove let");
   ("rr" cljr-remove-unused-requires "Remove unused requires")
   ("rs" cljr-rename-symbol "Rename symbol")
   ("ru" cljr-replace-use "Replace use")
   ("sn" cljr-sort-ns "Sort ns")
   ("sc" cljr-show-changelog "Show the project's changelog")
   ("sp" cljr-sort-project-dependencies "Sort project dependencies")
   ("sr" cljr-stop-referring "Stop referring")
   ("tf" cljr-thread-first-all "Thread first all")
   ("th" cljr-thread "Thread")
   ("tl" cljr-thread-last-all "Thread last all")
   ("ua" cljr-unwind-all "Unwind all")
   ("uw" cljr-unwind "Unwind")
   ("up" cljr-update-project-dependencies "Update project dependencies")
   ("ad" cljr-add-declaration "Add declaration")

   ("q" nil :exit truex))

(global-set-key (kbd "C-c r") 'hydra-cljr/body)

;; (key-chord-define-global
;;  "rr"
;;  'hydra-cljr/body)

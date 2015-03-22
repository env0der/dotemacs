;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(env0der colors html ruby clojure dash)

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(evil-escape)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. If the value is an integer then the
   ;; text banner with the corresponding index is used, if the value is
   ;; `random' then the banner is chosen randomly among the available banners,
   ;; if the value is a string then it must be a path to a .PNG file,
   ;; if the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'random
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(tango-dark)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ruby-version-manager 'rbenv
   ruby-enable-ruby-on-rails-support t
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (global-hl-line-mode -1)
  (blink-cursor-mode t)
  (setq powerline-default-separator 'arrow)
  (spacemacs/toggle-line-numbers)
  (linum-relative-toggle)
  (setq linum-relative-format "%3s ")
  (add-hook 'css-mode-hook 'rainbow-mode)
  (remove-hook 'enh-ruby-mode-hook 'flycheck-mode)
  (show-smartparens-global-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "gray100" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(font-lock-builtin-face ((t (:foreground "light sky blue"))))
 '(font-lock-comment-face ((t (:foreground "gray43"))))
 '(font-lock-string-face ((t (:foreground "yellow green"))))
 '(helm-selection ((t (:foreground "Green"))))
 '(helm-source-header ((t (:foreground "white" :weight bold))))
 '(highlight-symbol-face ((t (:background "gray30"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "gray100"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "purple1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "OrangeRed1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "OliveDrab3"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "cyan1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "SteelBlue1"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "salmon"))))
 '(region ((t (:background "gray50"))))
 '(sp-pair-overlay-face ((t (:inherit default))))
 '(sp-wrap-overlay-face ((t nil)))
 '(sp-wrap-tag-overlay-face ((t nil)))
 '(powerline-active1 ((t (:background "#2e3436" :foreground "gray80" :inherit mode-line))))
 '(fringe ((t (:background "#2e3436" :foreground "gray80"))))
 )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

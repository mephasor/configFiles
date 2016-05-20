;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     emacs-lisp
     c-c++
     auto-completion
     org
     java
     latex
     shell-scripts
     git
     github
     ranger
     python
     unimpaired
     )
   dotspacemacs-additional-packages '(
                                      evil-vimish-fold
                                      powerline
                                      sr-speedbar)
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-startup-recent-list-size 10
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; Org mode variables go in this block
  (with-eval-after-load 'org
    ;; set up project
    (setq org-publish-project-alist
          '(("konsLog"
             :base-directory "~/Projects/konsStuff/"
             :publishing-directory "~/Projects/konsStuffPub"
             :publishing-function org-html-publish-to-html
             :recursive t
             :base-extension "org"
             )))
    (setq org-todo-keywords
          '((sequence "TODO(t)" "NEXT(n)" "IN PROGRESS(p)" "|" "DONE(d!)" "CANCELLED(c!)")))
    (setq org-todo-keyword-faces
          '(("TODO" . org-warning)
            ("NEXT" . "orange")
            ("IN PROGRESS" . (:foreground "yellow" :weight bold))
            ("DONE" . "green") ("CANCELLED" . "red")))
    (setq org-agenda-custom-commands
          '(("K" "Kons Agenda"
             ((agenda "" ((org-agenda-ndays 7))) 
              (todo "IN PROGRESS")
              (todo "NEXT")
              (todo "TODO"))
             ((org-agenda-compact-blocks t))) ;; options set here apply to the entire block
            ;; ...other commands here
            ))
    ); end of org vars
  )

(defun dotspacemacs/user-config ()
 ; Set up git respository folder for magit
 (setq magit-repository-directories '("~/Project/")) 

 ; Folding like in vim. Adds zf and zd shortcuts.
 (require 'evil-vimish-fold)
 (evil-vimish-fold-mode 1)

 ; powerline vars
 (require 'powerline)
 (setq powerline-arrow-shape 'curve)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Projects/konsstuff/todo.org")))
 '(safe-local-variable-values
   (quote
    ((org-todo-keyword-faces
      ("DONE" . "green")
      ("TODO" . org-warning)
      ("IN PROGRESS" . "orange")
      ("NEXT" . org-warning))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

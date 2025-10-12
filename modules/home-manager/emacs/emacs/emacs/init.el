;; Turn off some unneeded UI elements
(menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; Load the Modus Vivendi dark theme
(load-theme 'modus-vivendi t)


(use-package helix
  :vc (:url "https://github.com/mgmarlow/helix-mode")
  :config
  (helix-mode))


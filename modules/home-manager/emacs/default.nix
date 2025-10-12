{
  config,
  inputs,
  pkgs,
  ...
}:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [
    # inputs.nix-doom-emacs-unstraightened.homeModule
  ];

  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];

  services.emacs = {
    enable = true;
    package = with pkgs; (
      (emacsPackagesFor emacs-unstable-pgtk).emacsWithPackages (
        epkgs: [
          epkgs.helix
          (epkgs.treesit-grammars.with-grammars (grammars: [ grammars.tree-sitter-bash ]))
          epkgs.vterm
        ]
      )
    );
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable-pgtk;
  };

  home.file = {
    ".config/emacs/init.el".source = link ./emacs/init.el;
    ".config/emacs/config.el".source = link ./emacs/config.el;
    ".config/emacs/config.org".source = link ./emacs/config.org;
    ".config/emacs/packages.el".source = link ./emacs/packages.el;
  };

  # programs.doom-emacs = {
  #   enable = true;
  #   doomDir = ./doom.d;
  #   extraPackages = epkgs: [
  #     epkgs.treesit-grammars.with-all-grammars
  #   ];
  # };

  # home.packages = with pkgs; [
  #   fd
  #   ripgrep
  #   ispell

  #   # Vterm
  #   gnumake
  #   cmake

  #   # Code tools
  #   csharpier
  # ];
}

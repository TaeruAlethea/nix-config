{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-doom-emacs-unstraightened.homeModule
  ];

  # nixpkgs.overlays = [ (import inputs.emacs-overlay) ];

  # services.emacs = {
  #   enable = true;
  #   package = with pkgs; (
  #     (emacsPackagesFor emacs-unstable-pgtk).emacsWithPackages (
  #       epkgs: [
  #         epkgs.helix
  #         (epkgs.treesit-grammars.with-grammars (grammars: [ grammars.tree-sitter-bash ]))
  #         epkgs.vterm
  #       ]
  #     )
  #   );
  # };

  # programs.emacs = {
  #   enable = true;
  #   package = pkgs.emacs-unstable-pgtk;
  # };

  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
  };

  home.packages = with pkgs; [
    fd
    ripgrep
    ispell

    # Vterm
    gnumake
    cmake

    # # Code tools
    # csharpier
  ];
}

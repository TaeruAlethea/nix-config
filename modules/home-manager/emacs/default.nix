{
  self,
  # inputs,
  pkgs,
  ...
}:
{
  imports = [
    # inputs.nix-doom-emacs-unstraightened.homeModule
  ];

  nixpkgs.overlays = [ (import self.inputs.emacs-overlay) ];

  services.emacs = {
    enable = true;
    package = with pkgs; (
      (emacsPackagesFor emacs-unstable-pgtk).emacsWithPackages (
        epkgs: [ epkgs.vterm ]
      )
    );
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

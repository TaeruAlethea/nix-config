{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-doom-emacs-unstraightened.homeModule
  ];

  services.emacs = {
    enable = true;
  };

  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;  # or e.g. `./doom.d` for a local configuration
  };

  home.packages = with pkgs; [
    fd
  ];
}

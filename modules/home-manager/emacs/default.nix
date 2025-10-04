{
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-doom-emacs-unstraightened.homeModule
  ];

  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;  # or e.g. `./doom.d` for a local configuration
  };
}

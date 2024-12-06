{ ... }:
{
  emacs = imports ./emacs/default.nix;
  fonts = imports ./fonts/default.nix;
  git = imports ./git/default.nix;
  hyprland = imports ./hyprland/default.nix;
  sops = imports ./sops/default.nix;
  ssh = imports ./ssh/default.nix;
  stylix = imports ./stylix/default.nix;
  waybar = imports ./waybar/default.nix;
}

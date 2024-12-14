{ ... }:
{
  emacs = import ./emacs;
  fonts = import ./fonts;
  git = import ./git;
  hyprland = import ./hyprland;
  sops = import ./sops;
  ssh = import ./ssh;
  stylix = import ./stylix;
  waybar = import ./waybar;
}
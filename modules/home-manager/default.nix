# No { ... }: because this is a set
{
  emacs = import ./emacs;
  fonts = import ./fonts;
  git = import ./git;
  helix = import ./helix;
  hyprland = import ./hyprland;
  niri = import ./niri;
  oh-my-posh = import ./oh-my-posh;
  sops = import ./sops;
  ssh = import ./ssh;
  stylix = import ./stylix;
  walker = import ./walker;
  waybar = import ./waybar;
  wezterm = import ./wezterm;
}

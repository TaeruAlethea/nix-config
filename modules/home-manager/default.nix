# No { ... }: because this is a set
{
  emacs = import ./emacs;
  fonts = import ./fonts;
  git = import ./git;
  hyprland = import ./hyprland;
  oh-my-posh = import ./oh-my-posh;
  sops = import ./sops;
  ssh = import ./ssh;
  stylix = import ./stylix;
  waybar = import ./waybar;
  wezterm = import ./wezterm;
}

{
  inputs,
  outputs,
  pkgs,
  config,
  ...
}:
let
  conf = pkgs.writeText "config" ''
    exec-once = hyprlock
    exec-once = waybar
    exec-once = swww init
  '';

# exec-once = dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'"
# exec-once = dconf write /org/gnome/desktop/interface/icon-theme "'Flat-Remix-Red-Dark'"
# exec-once = dconf write /org/gnome/desktop/interface/document-font-name "'Noto Sans Medium 11'"
# exec-once = dconf write /org/gnome/desktop/interface/font-name "'Noto Sans Medium 11'"
# exec-once = dconf write /org/gnome/desktop/interface/monospace-font-name "'Noto Sans Mono Medium 11'"
in
{
  programs = {
    uwsm = {
      enable = true;
    };

    hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
  };

  security = {
    polkit.enable = true;
    pam.services.hyprlock = { };
  };

  environment.systemPackages = with pkgs; [
    swww
    sysmenu

    loupe
    adwaita-icon-theme
    nautilus
    baobab
  ];

  services = {
    gvfs.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    accounts-daemon.enable = true;

    hypridle.enable = true;
  };
}

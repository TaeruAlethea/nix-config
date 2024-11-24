{ inputs, pkgs, config, ... }:
let
  conf = pkgs.writeText "config" ''
    exec-once = hyprlock
    exec-once = waybar
    exec-once = swww init
    '';

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

    hyprlock.enable = true;
    waybar.enable = true;
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

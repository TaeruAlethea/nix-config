{ inputs, pkgs, config, ... }:
let
  conf = pkgs.writeText "config" ''
    exec-once = waybar
    exec-once = swww init
    exec-once = hyprlock
    exec-once = kitty
  '';
in
{
  # services.xserver.displayManager.startx.enable = true;
  #services.greetd = {
  #  enable = true;
  #  settings.default_session.command = "Hyprland --config ${conf}";
  #};

  programs = {
    uwsm = {
      enable = true;
      #waylandCompositors.hyprland = {
      #  binPath = "/run/current-system/sw/bin/Hyprland";
      #  comment = "Hyprland session managed by uwsm";
      #  prettyName = "Hyprland";
      #};
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
    #pam.services.ags = {};
  };

  environment.systemPackages = with pkgs; [
    swww
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

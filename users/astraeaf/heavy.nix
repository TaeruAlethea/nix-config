{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  self,
  ...
}:
{
  imports = [
    outputs.userConfigs.astraeaf.core

    outputs.homeManagerModules.wezterm
    # outputs.homeManagerModules.emacs
    # outputs.homeManagerModules.fonts
    # outputs.homeManagerModules.git
    # outputs.homeManagerModules.hyprland
    # outputs.homeManagerModules.sops
    # outputs.homeManagerModules.ssh
    # outputs.homeManagerModules.stylix
    # outputs.homeManagerModules.waybar
  ];

    home = {
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "wezterm";
    };
  };

  # Home packages & programs
  home.packages = with pkgs; [
    bitwarden-desktop
    bitwarden-cli
    bottles

    blender
    gitkraken

    firefox-beta
    obsidian
    vesktop
    steam

    #dev
    jetbrains.rider
  ];

}

{
  inputs,
  outputs,
  pkgs,
  ...
}:
{
  imports = [
    outputs.userConfigs.astraeaf.core

    outputs.homeManagerModules.wezterm
    outputs.homeManagerModules.emacs
    # outputs.homeManagerModules.fonts
    # outputs.homeManagerModules.git
    # outputs.homeManagerModules.hyprland
    outputs.homeManagerModules.niri
    # outputs.homeManagerModules.sops
    # outputs.homeManagerModules.ssh
    # outputs.homeManagerModules.stylix
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
    gimp3-with-plugins
    gitkraken

    firefox-beta
    obsidian
    vesktop

    #dev
    jetbrains.rider

    # Unstable
    inputs.matui.packages.${system}.matui
  ];
}

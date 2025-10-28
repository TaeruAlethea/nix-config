{
  inputs,
  outputs,
  pkgs,
  ...
}:
{
  imports = [
    outputs.userConfigs.astraeaf.core

    outputs.homeManagerModules.dankMaterialShell
    outputs.homeManagerModules.wezterm
    outputs.homeManagerModules.emacs
    outputs.homeManagerModules.niri
    outputs.homeManagerModules.elgato
    # outputs.homeManagerModules.stylix
  ];

  home = {
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "wezterm";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
    package = pkgs.lyra-cursors;
    # [
      # graphite-cursors
      # layan-cursors
      # lyra-cursors
      # vimix-cursors
      # afterglow-cursors-recolored
    # ];
    
    name = "LyraS-cursors";
    size = 420;
  };
  home.sessionVariables.XCURSOR_SIZE = 420;

  # Home packages & programs
  home.packages = with pkgs; [
    bitwarden-desktop
    bitwarden-cli
    bottles

    blender
    gimp3-with-plugins
    gitkraken
    vlc

    firefox-beta
    obsidian
    vesktop
    zoom-us

    easyeffects

    #dev
    jetbrains.rider

    # Unstable
    inputs.matui.packages.${system}.matui
  ];
}

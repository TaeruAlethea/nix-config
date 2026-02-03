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
    outputs.homeManagerModules.ghostty
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
    package = pkgs.vimix-cursors;
    # [
      # graphite-cursors
      # layan-cursors
      # lyra-cursors   # LyraS-cursors"
      # vimix-cursors
      # afterglow-cursors-recolored
    # ];
    
    name = "Vimix-cursors";
    size = 36;
  };
  home.sessionVariables.XCURSOR_SIZE = 36;

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

    #games
    modrinth-app
    vintagestory
    xivlauncher

    easyeffects

    #dev
    jetbrains.rider
    # jdk25_headless
    jdk21_headless
    # jdk17_headless
    # jdk8_headless

    # Unstable
    inputs.matui.packages.${system}.matui
  ];
}

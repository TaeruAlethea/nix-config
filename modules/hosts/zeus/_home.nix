{
  pkgs,
  ...
}:
{
  programs.home-manager.enable = true;

  home = {
    username = "astraeaf";
    homeDirectory = "/home/astraeaf";
  };

  xdg.enable = true;

  programs = {
    bash.enable = true;
    gh.enable = true;
    gh-dash.enable = true;
    git.enable = true; # need to refactor the HM Module
    lazygit.enable = true;
    yazi.enable = true;
  };

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
  ];

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}

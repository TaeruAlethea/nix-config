{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "taeru";
    homeDirectory = "/home/taeru";

    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    packages = [
      pkgs.atool 
      pkgs.httpie 
    ];
  };

  programs = {
    autojump.enable = true;

    bash = {
      enable = true;
      # bashrcExtra = import ./DotConfigs/bashrc;
    };

    git = {
      enable = true;
      userName = "TaeruAlethea";
      userEmail = "61478538+TaeruAlethea@users.noreply.github.com";
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };

    kitty = {
      font.name = "hack-ttf";
      shellIntegration.enableBashIntegration = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      # settings = import ./DotConfigs/starship.toml;
    };
  };
  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

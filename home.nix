{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "taeru";
    homeDirectory = "/home/taeru";

    sessionVariables = {
      EDITOR = "vscode";
      BROWSER = "firefox";
      TERMINAL = "Kitty";
    };

    packages = [pkgs.atool pkgs.httpie];
  };

  programs.bash.enable = true;

  programs.git = {
    enable = true;
    userName = "TaeruAlethea";
    userEmail = "61478538+TaeruAlethea@users.noreply.github.com";
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

{pkgs, ...}: {
  home = {
    packages = [pkgs.atool pkgs.httpie];

    sessionVariables = {
      EDITOR = "vscode";
      BROWSER = "firefox";
      TERMINAL = "Kitty";
    };
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
}

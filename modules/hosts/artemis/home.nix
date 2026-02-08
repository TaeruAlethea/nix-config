{
  outputs,
  ...
}:
{
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true; # You get used to this, so always have it.

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

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}

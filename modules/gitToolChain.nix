{ pkgs, ... }:
{
  # flake.modules.nixos.gitToolChain = {
  # };

  flake.modules.homeManager.gitToolChain =
    { pkgs, ... }:
    {
      programs = {
        bash.enable = true;
        gh.enable = true;
        gh-dash.enable = true;
        git.enable = true;
        lazygit.enable = true;
        yazi.enable = true;
      };
    };
}

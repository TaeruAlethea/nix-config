{ ... }:
{
  flake.modules.nixos.communications = {
    # TODO: Discord/vesktop
    programs.zoom-us.enable = true;
  };
}

{ inputs, ... }:
{
  flake.modules.nixos.communications = {
    # TODO: Discord/vesktop
    programs.zoom-us.enable = true;
  };

  flake.modules.homeManager.communications = {
    imports = with inputs.self.modules.homeManager; [
      vesktop
    ];
  };
}

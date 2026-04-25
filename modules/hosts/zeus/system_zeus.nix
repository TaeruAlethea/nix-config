{ inputs, pkgs, ... }:
{
  flake.modules.nixos.system_zeus = {
    networking = {
      hostName = "zeus";
      networkmanager.enable = true;
    };

    imports = with inputs.self.modules.nixos; [
      system_base

      window-manager
    ];
  };

  flake.modules.homeManager.system_zeus = {
    imports = with inputs.self.modules.homeManager; [
      system_base

      gaming
    ];

    # Home packages & programs
    home.packages = with pkgs; [
      blender
      gimp3-with-plugins
      reaper
      vlc

      obsidian
    ];

  };
}

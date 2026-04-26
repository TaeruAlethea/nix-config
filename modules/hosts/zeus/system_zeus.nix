{ inputs, ... }:
{
  flake.modules.nixos.system_zeus = {
    networking = {
      hostName = "zeus";
      networkmanager.enable = true;
    };

    imports = with inputs.self.modules.nixos; [
      system_base
      window-manager
      audio
      powerManagement

      communications
      gaming
      vr
    ];
  };

  flake.modules.homeManager.system_zeus = {pkgs, ... }: {
    imports = with inputs.self.modules.homeManager; [
      system_base
      window-manager
      audio
      elgato

      communications
      firefox
      gaming
      vr
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

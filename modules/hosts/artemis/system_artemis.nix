{ inputs, ... }:
{
  flake.modules.nixos.system_artemis = {
    networking = {
      hostName = "artemis";
      networkmanager.enable = true;
    };

    imports = with inputs.self.modules.nixos; [
      system_base
      window-manager
      audio
      powerManagement
      razer

      communications
      gaming
      vr
    ];
  };

  flake.modules.homeManager.system_artemis =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        system_base
        window-manager
        audio

         gaming
      ];

      # Home packages & programs
      home.packages = with pkgs; [
        blender
        gimp3-with-plugins
        reaper
        vlc
      ];

    };
}

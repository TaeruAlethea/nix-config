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
      terminal
    ];
  };
}

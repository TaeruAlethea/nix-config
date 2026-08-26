{ inputs, ... }:
{
  flake.modules.nixos.system_ares = {
    networking = {
      hostName = "ares";
      networkmanager.enable = true;
    };

    imports = with inputs.self.modules.nixos; [
      system_base
      window-manager
      audio
      powerManagement

      communications
      terminal
    ];
  };
}

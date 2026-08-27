{ inputs, ... }:
{
  flake.modules.nixos.system_hera = { ... }:{
    networking = {
      hostName = "hera";
      networkmanager.enable = true;
    };

    imports = with inputs.self.modules.nixos; [
      system_base
      powerManagement
      sshServer

      terminal
    ];
  };
}

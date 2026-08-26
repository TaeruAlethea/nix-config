{ inputs, ... }:
{
  flake.nixosConfigurations.hera = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos.host_hera
    ];
  };

  flake.modules.nixos.host_hera = {
    imports = with inputs.self.modules.nixos; [
      hardware_zeus
      nvidia
      system_hera

      user_astraeaf
    ];
  };
}

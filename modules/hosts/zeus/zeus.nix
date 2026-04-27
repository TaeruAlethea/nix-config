{ inputs, ... }:
{
  flake.nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos.host_zeus
    ];
  };

  flake.modules.nixos.host_zeus = {
    imports = with inputs.self.modules.nixos; [
      hardware_zeus
        nvidia
      system_zeus

      user_astraeaf
    ];
  };
}

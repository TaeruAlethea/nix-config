{ inputs, ... }:
{
  flake.nixosConfigurations.ares = inputs.nixpkgs.lib.nixosSystem {
    modules = [ inputs.self.modules.nixos.host_ares ];
  };
  flake.modules.nixos.host_ares = {
    imports = with inputs.self.modules.nixos; [
      hardware_ares
      system_ares

      user_astraeaf
    ];
  };
}

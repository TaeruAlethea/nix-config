{ inputs, ... }:
{
  flake.nixosConfigurations.artemis = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos.host_artemis
    ];
  };

  flake.modules.nixos.host_artemis = {
    imports = with inputs.self.modules.nixos; [
      hardware_artemis # hardware-config.nix
      system_artemis

      user_astraeaf
    ];
  };
}

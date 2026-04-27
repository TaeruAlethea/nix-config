{ inputs, ... }:
{
  flake.nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos.host_zeus
    ];
  };

  flake.modules.nixos.host_zeus = {
    imports = with inputs.self.modules.nixos; [
      system_zeus
      user_astraeaf

      audio
      hardware_zeus
      nvidia
      razer
    ];
  };

  flake.modules.homeManager.host_zeus = {
    home.packages = with inputs.self.modules.homeManager; [
      audio
    ];

  };
}

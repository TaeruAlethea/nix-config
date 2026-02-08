{ inputs, ...}: {
  flake = {
    nixosConfigurations.artemis = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        ./config.nix
        self.nixosModules.defaultFonts  
      ];
    };
  };
}
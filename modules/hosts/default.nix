{ inputs, self, ...}: {
  flake = {
    nixosConfigurations.ares = inputs.nixpkgs.lib.nixosSystem {
      modules = [ ./ares ];
    };

    nixosConfigurations.artemis = inputs.nixpkgs.lib.nixosSystem {
      modules = [ 
        ./artemis
        self.nixosModules.defaultFonts
      ];
    };

    nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
      modules = [ ./zeus ];
    };
  };
}

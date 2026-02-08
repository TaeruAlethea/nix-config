{ inputs, ...}: {
  flake = {
    nixosConfigurations.ares = inputs.nixpkgs.lib.nixosSystem {
      modules = [ ./ares ];
    };

    nixosConfigurations.artemis = inputs.nixpkgs.lib.nixosSystem {
      modules = [ ./artemis ];
    };

    nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
      modules = [ ./zeus ];
    };
  };
}

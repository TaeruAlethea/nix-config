{
  flake = {

    nixosConfigurations.ares = nixosSystem {
      modules = ./ares;
    };

    nixosConfigurations.artemis = nixosSystem {
      modules = ./artemis;
    };

    nixosConfigurations.zeus = nixosSystem {
      modules = ./zeus;
    };
  };
}

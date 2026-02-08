{ inputs, ...}: {
  flake = {
    homeConfigurations.astraeaf = inputs.home-manager.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      modules = [ 
        ./astraeaf/core.nix
        ./astraeaf/artemis.nix
      ];
    };
  };
}

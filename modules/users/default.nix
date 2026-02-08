{ inputs, ...}: {
  flake = {
    homeConfigurations.astraeaf = home-manager.homeManagerConfiguration {
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

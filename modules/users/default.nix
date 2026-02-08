{ inputs, ...}: {
  flake = {
    homeConfigurations.astraeaf = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        config.allowUnfree = true;
      };
      modules = [ 
        ./astraeaf/core.nix
        #./astraeaf/artemis.nix
      ];
    };
  };
}

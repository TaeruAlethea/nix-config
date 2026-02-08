{ inputs, config, ...}: {
  flake = {
    homeConfigurations.astraeaf = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        config.allowUnfree = true;
        system = "x86_64-linux";
      };
      modules = [ 
        ./astraeaf/core.nix
        #./astraeaf/artemis.nix

        config.homeModules.oh-my-posh
        config.homeModules.helix
      ];
    };
  };
}

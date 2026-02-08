{ inputs, ...}: {
  flake = {
    homeConfigurations.astraeaf.artemis = {
      modules = [ 
        ./astraeaf/core.nix
        ./astraeaf/artemis.nix
      ];
    };
  };
}

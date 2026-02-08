{ inputs, self, ...}: {
  flake = {
    nixosConfigurations.artemis = inputs.nixpkgs.lib.nixosSystem {
      pkgs = import inputs.nixpkgs {
        config.allowUnfree = true;
        system = "x86_64-linux";
      };
      modules = [
        ./artemis/config.nix
        
        self.nixosModules.defaultFonts

        inputs.home-manager.nixosModules.home-manager 
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.astraeaf = ./artemis/home.nix;
            backupFileExtension = "bk";
            overwriteBackup = true;
            extraSpecialArgs = {
          
              # bring in the list of inputs into the home-manager module
              inherit inputs;
              system = "x86_64-linux";
            };
          };
        }
      ];
    };
  };
}


#{
#  imports = [
#    ./ares
#    ./artemis
#    ./zeus
#  ];
#}

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
          homeConfigurations.astraeaf = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = import inputs.nixpkgs {
              config.allowUnfree = true;
              system = "x86_64-linux";
            };
            modules = [ 
              ./astraeaf/core.nix
              #./astraeaf/artemis.nix

              self.homeModules.oh-my-posh
              #self.homeModules.helix
            ];
          };

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.astraeaf = ./artemis/home.nix;
            backupFileExtension = "bk";
            overwriteBackup = true;
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

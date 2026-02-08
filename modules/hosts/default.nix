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
          imports = [
            self.homeModules.oh-my-posh
          ];

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

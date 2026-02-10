{ inputs, self, config, ...}: {
  flake.nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
      pkgs = import inputs.nixpkgs {
        config.allowUnfree = true;
        system = "x86_64-linux";
      };
      modules = [
        ./nixos.nix
        
        self.nixosModules.agenix
        self.nixosModules.defaultFonts
        self.nixosModules.localization
        self.nixosModules.niri
        self.nixosModules.steam
        self.nixosModules.terminal

        inputs.agenix.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.astraeaf.imports = with config.flake.homeModules; [
              ./home.nix
              
              dankMaterialShell
              elgato
              helix
              niri
              oh-my-posh
              wezterm
            ];
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
}
{
description = "TaeruAlethea's flake";

outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    stylix, 
    ... 
  }@inputs: 
  let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
      #"aarch64-darwin"
    ];
    inherit (nixpkgs) lib;
    configVars = import ./vars { inherit inputs lib; };
    configLib = import ./lib { inherit lib; };
    specialArgs = {
      inherit
        inputs
        outputs
        configVars
        configLib
        nixpkgs
        ;
    };
  in
  {

  # formatter, command through 'nix fmt' https://nix-community.github.io/nixpkgs-fmt
  formatter = forAllSystems (system: nixpkgs.${system}.nixfmt-rfc-style);

  # Configurations. Additional hosts should be added inside nixosConfigurations
    nixosConfigurations = {
      ares = lib.nixosSystem {
        inharit specialArgs;
        modules = [
          { home-manager.extraSpecialArgs = specialArgs; }
          ./hosts/ares
        ];
      };
    };
  };

inputs = {
  ### NixOS and HM Package Sources ###
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  ### Utilities ###

  # Secret Management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Themeing
    stylix.url = "github:danth/stylix";

  # Vim. As good a time to learn it as any.
    nixvim ={
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}

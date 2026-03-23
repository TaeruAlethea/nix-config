{
  description = "Taeru's config flake";

  outputs = inputs@{ flake-parts, ...}:
    # https://flake.parts/module-arguments.html
    flake-parts.lib.mkFlake { inherit inputs; } (top@{ config, withSystem, moduleWithSystem, ... }: {
      imports = [
        inputs.home-manager.flakeModules.home-manager
        
        (inputs.import-tree ./modules)
      ];
      systems = [ "x86_64-linux" ];
      perSystem = { system, ... }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
    });
  
  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
 
    # Only needed for Windows Subsystem for Linux
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };
}

{ inputs, lib, ... }:
{
  imports = [
    inputs.flake-file.flakeModules.dendritic
    inputs.flake-file.flakeModules.nix-auto-follow
    inputs.flake-parts.flakeModules.modules
  ];

  flake-file = {
    description = "Taeru's config flake";

    inputs = {
      nixpkgs.url = lib.mkForce "github:nixos/nixpkgs/nixos-unstable";
      nixos-hardware.url = "github:NixOS/nixos-hardware/master";
      # Only needed for Windows Subsystem for Linux
      nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    };
  };


  flake.modules.nixos.base = {
    nixpkgs.config.allowUnfree = true;
  };
}

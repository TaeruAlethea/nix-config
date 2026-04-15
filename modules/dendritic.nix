{ inputs, lib, ... }:
{
  imports = [
    inputs.flake-file.flakeModules.dendritic
    # inputs.flake-file.flakeModules.allfollow
  ];

  flake-file = {
    description = "Taeru's config flake";

    inputs.nixpkgs.url = lib.mkForce "github:nixos/nixpkgs/nixos-unstable";
  };
}

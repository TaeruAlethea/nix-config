{
  inputs,
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
  ];

  ######
  # I consider WSL to be a "hardware-configuration" scope thing.
  # "hardware" in this context happens to be a Windows container, 
  # so it counts.
  # https://github.com/nix-community/NixOS-WSL
  ######

  # WSL is closer to a container than anything else
  boot.isContainer = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

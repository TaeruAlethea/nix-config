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
    inputs.nixos-hardware.nixosModules.microsoft-surface-common
  ];

  ######
  # I consider WSL to be a "hardware-configuration" scope thing.
  # "hardware" in this context happens to be a Windows container, 
  # so it counts.
  ######

  # WSL is closer to a container than anything else
  boot.isContainer = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

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
    
    # WSL is closer to a container than anything else
    boot.isContainer = true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
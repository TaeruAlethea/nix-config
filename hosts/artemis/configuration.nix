# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, outputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default

    outputs.nixosModules.agenix
    outputs.nixosModules.fonts
    outputs.nixosModules.localization
  ];

  wsl ={
    enable = true;
    defaultUser = "astraeaf";
    wslConf = {
      network.hostname = "artemis";
    };
  };

  nix ={
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  networking.hostname = "artemis";

  users.mutableUsers = false;
  users.users.astraeaf = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.secret1.path;
    description = "Astraea Falke";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    helix
  ];

  programs.nh = {
    enable = true;
    flake = "/home/astraeaf/nix-config";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    inputs.nixos-wsl.nixosModules.default
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
      };
      # Opinionated: disable channels
      channel.enable = false;

      # Opinionated: make flake registry and nix path match flake inputs
      #registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
      #nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # WSL is closer to a container than anything else
  boot.isContainer = true;
  wsl.enable = true;
  wsl.defaultUser = "astraeaf";
  wsl.wslConf.network.hostname = "artemis";

  environment.etc.hosts.enable = false;
  environment.etc."resolv.conf".enable = false;

  users.mutableUsers = false; # Required for Sops
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.astraeaf = {
    description = "Astraea Falke";
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.astraeaf-password.path;
  };

  programs.nh.enable = true;

  environment.sessionVariables = {
    FLAKE = "/home/astraeaf/nix-config";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
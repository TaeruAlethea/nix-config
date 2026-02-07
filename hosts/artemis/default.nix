# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, outputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  networking.hostName = "artemis";

  # Enable networking
  networking.networkmanager.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "astraeaf";

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session ={
        command = "niri-session";
        user = "astraeaf";
      };
    default_session = initial_session;
    };
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  #hardware.alsa.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  home-manager.users.astraeaf = outputs.userConfigs.artemis;
  users.users.astraeaf = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.secret1.path;
    description = "Astraea Falke";
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
    ];
    packages = with pkgs; [
    ];
  };

  # Needed for Nautilus file Browser
  services.gvfs.enable = true; 
  environment.pathsToLink = [ "share/thumbnailers" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #audio
    wireplumber
    coppwr
    nautilus # File Browser
      libheif libheif.out # Image Preview in Nautilus

    git
    github-desktop
    helix # Text editor!

    # Formatters
    treefmt
    nixfmt-rfc-style
    yamlfmt
  ];

  programs.zoom-us.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/astraeaf/nix-config";
  };

  system.stateVersion = "25.05";
}

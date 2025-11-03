# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
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
    ./hardware-configuration.nix

    inputs.agenix.nixosModules.default

    outputs.nixosModules.niri

    outputs.nixosModules.agenix
    outputs.nixosModules.fonts
    outputs.nixosModules.localization
    
    outputs.nixosModules.terminal
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

  networking.hostName = "ares"; # Define your hostname.

  networking.networkmanager.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

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
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.astraeaf = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.secret1.path;
    description = "Astraea Falke";
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
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
    brightnessctl #backlight control
    
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

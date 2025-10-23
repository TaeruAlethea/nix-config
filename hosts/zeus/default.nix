{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    inputs.agenix.nixosModules.default

    outputs.nixosModules.niri

    outputs.nixosModules.agenix
    outputs.nixosModules.fonts
    outputs.nixosModules.localization
    
    outputs.nixosModules.terminal
    outputs.nixosModules.steam
  ];

  # Steam/Deadlock need this
  boot.kernel.sysctl = {
    "vm.max_map_count" = 1048576;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  networking.hostName = "zeus"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking

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

  users.users.astraeaf = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.secret1.path;
    description = "Astraea Falke";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
      "plugdev"
    ];
    packages = with pkgs; [
      dotnetCorePackages.sdk_9_0-bin
      dotnetCorePackages.sdk_8_0-bin
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

    # Peripherals
    openrazer-daemon
    polychromatic
    opendeck

    git
    github-desktop
    helix # Text editor!

    # Formatters
    treefmt
    nixfmt-rfc-style
    yamlfmt
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    opendeck = pkgs.callPackage outputs.customPkgs.opendeck {};
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

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

  networking.hostName = "zues"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
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
    ];
    packages = with pkgs; [
      dotnetCorePackages.sdk_9_0-bin
      dotnetCorePackages.sdk_8_0-bin
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "astraeaf";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #audio
    wireplumber
    coppwr

    # Peripherals
    openrazer-daemon
    polychromatic

    git
    github-desktop
    helix # Text editor!

    # Formatters
    treefmt
    nixfmt-rfc-style
    yamlfmt
  ];

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

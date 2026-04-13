{  config, pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./_hardware-configuration.nix
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
    jack.enable = true;
  };

  services = {
    power-profiles-daemon = {
      enable = true;
    };
  };
  powerManagement.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
   };

  services.udev.extraRules = ''
    # Moza sim stuff
    SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="346e", ACTION=="add", MODE="0666", TAG+="uaccess"

    # Ignore PS5 touchpad
    ACTION=="add|change", KERNEL=="event[0-9]*", ATTRS{name}=="*Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';

  users.users.astraeaf = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.astraeaf-pw.path;
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
  services.udisks2.enable = true;
  environment.pathsToLink = [ "share/thumbnailers" ];

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

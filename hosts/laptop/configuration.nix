# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let
	inputImage = /home/astraeaf/Pictures/wallpaper.jpg;
	brightness = -30;
	contrast = 0;
	fillColor = "black";
	theme = "${pkgs.base16-schemes}/share/themes/irblack.yaml";
#	wallpaper = pkgs.runCommand "image.png" {} ''
#		COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${theme})
#		COLOR="#"$COLOR
#		${pkgs.imagemagick}/bin/magick convert -size 1920x1080 xc:$COLOR $out
#	'';
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/nixos/hyprland.nix
      inputs.home-manager.nixosModules.default
      inputs.sops-nix.nixosModules.sops
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "astraeaf";
    sddm = {
      enable = true;
      wayland.enable = true;
      settings.autoLogin.relogin = true;
    };
  };
  # services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  sops = {
    defaultSopsFile = ./secrets.yaml;
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    
    secrets = {
      github = {};
      astraeaf-password.neededForUsers = true;
    };
  };
  users.mutableUsers = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.astraeaf = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.astraeaf-password.path;
    description = "Astraea Falke";
    extraGroups = [ "networkmanager" "wheel" ];
     # openssh.authorizedKeys.keyFiles = [ ./ssh/id_ed25519 ];
      packages = with pkgs; [
      kdePackages.kate

      firefox-wayland
      obsidian
      vesktop
    ];
  };

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "astraeaf" = import ./home.nix;
    };
  };

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = theme;
    polarity = "dark";
    image = config.lib.stylix.pixel "base01";
#    image = pkgs.runCommand "dimmed-background.png" { } ''
#      ${pkgs.imagemagick}/bin/convert "${inputImage}" -brightness-contrast ${brightness},${contrast} -fill ${fillColor} $out
#    '';
#    image = "/home/astraeaf/Pictures/wallpaper.jpg";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    age
    git
    github-desktop
    #ssh-to-sops
    sops
    starship
    powerline-fonts
  ];

  environment.sessionVariables = {
    FLAKE = "/home/astraeaf/nix-config";
  };

  programs.nh = {
    enable = true;
    # flake = "/home/astraeaf/nix-config";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?
}

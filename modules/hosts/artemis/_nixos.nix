{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./_hardware-configuration.nix
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

  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
    power-profiles-daemon = {
      enable = true;
    };
    upower = {
      enable = true;
    };
  };
  powerManagement.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    # settings = {
    #   General = {
    #     ControllerMode = "dual";
    #     Disable = "Headset";
    #     MultiProfile = "multiple";
    #   };
    # };
  };
  # services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.astraeaf = {
    isNormalUser = true;
    description = "astraeaf";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
    packages = with pkgs; [
    #  thunderbird
      asusctl
    ];
  };

  environment.systemPackages = with pkgs; [
    helix
    vpl-gpu-rt
  ];

  programs.light.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/astraeaf/nix-config";
  };

  system.stateVersion = "25.05";

}

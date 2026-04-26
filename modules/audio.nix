{ ... }:
{
  flake.modules.nixos.audio = {pkgs, ...}: {
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;

    #hardware.alsa.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wireplumber
    ];
  };

  flake.modules.homeManager.audio = {pkgs, ... }: {
    home.packages = with pkgs; [
      coppwr
      easyeffects
    ];

  };
}

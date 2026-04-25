{ pkgs, ... }:
{
  flake.modules.nixos.razer = {
    hardware = {
      openrazer = {
        enable = true;
        users = [ "astraeaf" ];
      };
    };

    environment.systemPackages = with pkgs; [
      # Peripherals
      openrazer-daemon
      polychromatic

    ];

  };
}

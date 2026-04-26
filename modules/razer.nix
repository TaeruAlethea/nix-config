{ ... }:
{
  flake.modules.nixos.razer = {pkgs, ... }: {
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

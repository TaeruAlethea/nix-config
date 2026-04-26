{ ... }:
{
  flake.modules.nixos.powerManagement = {
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
  };
}

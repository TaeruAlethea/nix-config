{ ... }:
{
  flake.modules.nixos.powerManagement = {
    services = {
      acpid.enable = true;
      power-profiles-daemon.enable = true;
      upower.enable = true;
      
    };
    powerManagement.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}

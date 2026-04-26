{ ... }:
{
  flake.modules.nixos.nvidia = {pkgs, ... }: {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      nvidia = {
        # package = config.boot.kernelPackages.nvidiaPackages.production;

        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
      };
    };

    services.xserver.videoDrivers = [
      "modesetting"
      "nvidia"
    ];
    environment.systemPackages = with pkgs; [
      nvtopPackages.nvidia
    ];

    boot.kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_drm"
    ];

    boot.blacklistedKernelModules = [ "nouveau" ];

    nixpkgs.config.cudaSupport = true;
  };
}

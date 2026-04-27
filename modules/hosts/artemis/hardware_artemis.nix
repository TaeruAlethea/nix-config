{ lib, ... }:{

flake.modules.nixos.hardware_artemis = 
{
  config,
  pkgs,
  ...
}:

{
        hardware.enableRedistributableFirmware = lib.mkDefault true;

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      fontSize = 48;
      gfxmodeEfi = "1280x720";
    };
  };

  hardware.intel-gpu-tools.enable = true;
  # hardware.intelgpu.driver = "xe";
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      vpl-gpu-rt
      libvdpau-va-gl
      mesa
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # Supposed to force newer Drivers
  };
  hardware.firmware = [
    (
      let
        model = "37xx";
        version = "0.0";

        firmware = pkgs.fetchurl {
          url = "https://github.com/intel/linux-npu-driver/raw/v1.28.0/firmware/bin/vpu_${model}_v${version}.bin";
          hash = "sha256-CLxevoWz81uNcxtuNdboF7C7RM6CMeaNA93bUZaxm+U=";
        };
      in
      pkgs.runCommand "intel-vpu-firmware-${model}-${version}" { } ''
        mkdir -p "$out/lib/firmware/intel/vpu"
        cp '${firmware}' "$out/lib/firmware/intel/vpu/vpu_${model}_v${version}.bin"
      ''
    )
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "vmd"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-intel"
    "i915"
  ];
  boot.kernelParams = [ "i915.enable_psr=0" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/908578c3-f579-4fe3-8368-6c94f88bf27e";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8A3B-B4C6";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/8d4d59c6-4f84-4d4d-9e29-f923b35f0fe3"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
};
}

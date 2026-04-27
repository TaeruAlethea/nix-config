{ ... }:
{
  flake.modules.nixos.vr =
    { pkgs, ... }:
    {
      services.udev.extraRules = ''
        # Moza sim stuff
        SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="346e", ACTION=="add", MODE="0666", TAG+="uaccess"
      '';

      services.wivrn = {
        enable = true;
        openFirewall = true;

        # Run WiVRn as a systemd service on startup
        autoStart = true;

        # If you're running this with an nVidia GPU and want to use GPU Encoding (and don't otherwise have CUDA enabled system wide), you need to override the cudaSupport variable.
        package = (pkgs.wivrn.override { cudaSupport = true; });
      };
    };

  flake.modules.homeManager.vr =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        boxflat # Moza Sim stuff
      ];
    };
}

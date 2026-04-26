{  ... }:
{
  flake.modules.nixos.gaming = {
    services.udev.extraRules = ''
      # Moza sim stuff
      SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="346e", ACTION=="add", MODE="0666", TAG+="uaccess"

      # Ignore PS5 touchpad
      ACTION=="add|change", KERNEL=="event[0-9]*", ATTRS{name}=="*Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    '';
    # Steam/Deadlock need this
    boot.kernel.sysctl = {
      "vm.max_map_count" = 1048576;
    };

  };

  flake.modules.homeManager.gaming ={pkgs, ... }:  {
    # Home packages & programs
    home.packages = with pkgs; [
      prismlauncher # Minecraft
      # jdk25_headless
      jdk21_headless
      # jdk17_headless
      # jdk8_headless

      r2modman
      vintagestory
      xivlauncher
      boxflat # Moza Sim stuff
      lutris
    ];

  };
}

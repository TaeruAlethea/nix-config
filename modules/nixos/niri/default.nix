{ inputs, ... }:
{
  flake-file.inputs.niri = {
    url = "github:sodiboo/niri-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      imports = [
        inputs.niri.nixosModules.niri
      ];

      nixpkgs.overlays = [ inputs.niri.overlays.niri ];
      programs.niri.package = pkgs.niri-unstable;

      systemd.user.services.niri-flake-polkit.enable = false;

      programs.niri = {
        enable = true;
      };

      programs.gnome-disks.enable = true;

      services.gnome = {
        sushi.enable = true;
      };

      environment.systemPackages = with pkgs; [
        xwayland-satellite
        nautilus
        image-roll
        libheif
        libheif.out # Image Preview in Nautilus

        xdg-desktop-portal-gtk
      ];

      # Needed for Nautilus file Browser
      environment.pathsToLink = [ "share/thumbnailers" ];

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        SDL_VIDEODRIVER = "wayland";
      };

      # environment.sessionVariables = {
      # 	DISPLAY = ":0";
      # };
    };

  flake.modules.homeManager.niri = { pkgs, osConfig, lib, ... }:
    {
      # imports = [
      #   inputs.niri.homeModules.niri
      # ];

      home.packages = with pkgs; [
        jq # needed for Artemis. Not bad to have around
        brightnessctl
      ];

      programs.niri.settings = lib.recursiveUpdate (import ./_${osConfig.networking.hostName}.nix) (
        import ./_commonConfig.nix
      );



    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      hyprcursor.enable = true;
      package = pkgs.vimix-cursors;
      # [
      # graphite-cursors
      # layan-cursors
      # lyra-cursors   # LyraS-cursors"
      # vimix-cursors
      # afterglow-cursors-recolored
      # ];

      name = "Vimix-cursors";
      size = 36;
    };
    home.sessionVariables.XCURSOR_SIZE = 36;
  };
}

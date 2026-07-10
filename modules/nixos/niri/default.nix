{ inputs, ... }:
{
  flake-file.inputs = {
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
    };
  };

  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      imports = [
        inputs.niri-nix.nixosModules.default
      ];

      nixpkgs.overlays = [ inputs.niri-nix.overlays.niri-nix ];
      programs.niri.package = pkgs.niri-unstable;

      systemd.user.services.niri-flake-polkit.enable = false;

      programs.niri = {
        enable = true;
      };

      programs.gnome-terminal.enable = false;
      environment.gnome.excludePackages = with pkgs; [
        gnome-console
      ];

      services.gnome = {
        core-apps.enable = true;
      };

      environment.systemPackages = with pkgs; [
        xwayland-satellite
        nautilus
        image-roll
        libheif
        libheif.out # Image Preview in Nautilus
      ];

      xdg = {
        mime = {
          enable = true;
          defaultApplications = {
            "inode/directory" = "nautilus.desktop";
          };
        };
      };

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

  flake.modules.homeManager.niri =
    {
      pkgs,
      osConfig,
      lib,
      ...
    }:
    {
      imports = [
        inputs.niri-nix.homeModules.default
      ];

      home.packages = with pkgs; [
        jq # needed for Artemis. Not bad to have around
        brightnessctl
      ];

      programs.niri.settings = lib.recursiveUpdate (import ./_${osConfig.networking.hostName}.nix) (
        import ./_commonConfig.nix
      );

      home.pointerCursor = {
        enable = true;
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

{ inputs, ... }:
{
  flake-file.inputs = {
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    matugen = {
      url = "github:/InioX/Matugen";
      inputs.nixpkgs.follows = "nixpkgs";
      # If you need a specific version:
      # ref = "refs/tags/matugen-v0.10.0";
    };
  };

  flake.modules.homeManager.dankMaterialShell =
    {
      pkgs,
      osConfig,
      ...
    }:
    {
      imports = [
        inputs.dankMaterialShell.homeModules.dank-material-shell
        inputs.dankMaterialShell.homeModules.niri
        inputs.dms-plugin-registry.modules.default
        inputs.matugen.nixosModules.default
      ];

      home.packages = with pkgs; [
        accountsservice
        wl-clipboard
        networkmanager
        power-profiles-daemon
        i2c-tools
        adw-gtk3
        kdePackages.qt6ct
      ];

      programs.dank-material-shell = {
        enable = true;

        niri = {
          includes = {
            enable = true;
            originalFileName = "hm";
          };
          enableKeybinds = true; # Sets static preset keybinds
          # enableSpawn = true; # Auto-start DMS with niri, if enabled
        };

        systemd = {
          enable = true;
          restartIfChanged = true;
        };

        # Core features
        enableSystemMonitoring = true; # System monitoring widgets (dgop)
        enableVPN = true; # VPN management widget
        enableDynamicTheming = true; # Wallpaper-based theming (matugen)
        enableAudioWavelength = true; # Audio visualizer (cava)
        enableCalendarEvents = true; # Calendar integration (khal)
        enableClipboardPaste = true; # Pasting items from the clipboard (wtype)

        settings = import ./_${osConfig.networking.hostName}.nix;

        plugins = {
          # Add plugin-specific settingsi
          dankPomodoroTimer.enable = true;
          dankCalculator = {
            enable = true;
            src = pkgs.fetchFromGitHub {
              owner = "rochacbruno";
              repo = "DankCalculator";
              tag = "0.2.2";
              sha256 = "sha256-bhV22bL38CJp58Y8tCY8sEBRYxmuk671fEymmdg0Yuk=";
            };
          };
        };
      };

      qt.platformTheme = "qt6ct";

      home.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
      };
    };
}

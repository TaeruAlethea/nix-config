{ ... }: {
	flake.homeModules.dankMaterialShell = { inputs, pkgs, osConfig, ... }:
	{
		imports = [
			inputs.dankMaterialShell.homeModules.dank-material-shell
			inputs.dms-plugin-registry.modules.default
			inputs.matugen.nixosModules.default
			inputs.dankMaterialShell.homeModules.niri
		];

		home.packages = with pkgs; [
			accountsservice
			wl-clipboard
			networkmanager
			power-profiles-daemon
			i2c-tools
		];

		programs.dank-material-shell = {
			enable = true;

			niri = {
				enableKeybinds = true;   # Sets static preset keybinds
				enableSpawn = true;      # Auto-start DMS with niri, if enabled
			};

			# Core features
			enableSystemMonitoring = true;     # System monitoring widgets (dgop)
			enableVPN = true;                  # VPN management widget
			enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
			enableAudioWavelength = true;      # Audio visualizer (cava)
			enableCalendarEvents = true;       # Calendar integration (khal)
			enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)

			settings = import ./${osConfig.networking.hostName}.nix;

			plugins = {
				# Add plugin-specific settingsi
				dankPomodoroTimer.enable = true;
				dankKDEConnect.enable = true;
			};
		};

		qt.platformTheme = "kde";

		home.sessionVariables = {
			QT_QPA_PLATFORMTHEME = "qt6ct";
			QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
		};
	};
}

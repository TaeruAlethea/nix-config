{ inputs, pkgs, ... }:
{
	imports = [
		inputs.dankMaterialShell.homeModules.dank-material-shell
		inputs.dms-plugin-registry.modules.default
		inputs.matugen.nixosModules.default
		# inputs.dankMaterialShell.homeModules.niri
	];

	home.packages = with pkgs; [
		wl-clipboard
	];

	programs.dank-material-shell = {
			enable = true;

		plugins = {
			# Add plugin-specific settingsi
			dankPomodoroTimer.enable = true;
			dankKDEConnect.enable = true;

      mediaPlayer = {
        enable = true;
        # You can only define settings here if using the home-manager module
        settings = {
          preferredSource = "youtube";
        };
			};
		};
	};

	qt.platformTheme = "kde";

	home.sessionVariables = {
		QT_QPA_PLATFORMTHEME = "qt6ct";
		QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
	};

	xdg.configFile."DankMaterialShell/" = {
	  source = ./config;
	  recursive = true;
	};
}

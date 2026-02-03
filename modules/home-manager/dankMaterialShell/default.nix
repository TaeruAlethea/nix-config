{ inputs, pkgs, ... }:
{
	imports = [
		inputs.dankMaterialShell.homeModules.default
		inputs.dankMaterialShell.homeModules.niri
	];

	home.packages = with pkgs; [
		wl-clipboard
	];

	programs = {
		dank-Material-Shell.enable = true;
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

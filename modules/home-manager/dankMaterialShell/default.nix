{ inputs, pkgs, ... }:
{
	imports = [
		inputs.dankMaterialShell.homeModules.dankMaterialShell.default
		inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
	];

	home.packages = with pkgs; [
		wl-clipboard
	];

	programs = {
		dankMaterialShell.enable = true;
	};

	qt.platformTheme = "kde";

	home.sessionVariables = {
		QT_QPA_PLATFORMTHEME = "qt6ct";
		QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
	};

	# xdg.configFile."DankMaterialShell/" = {
	  # source = ./config;
	  # recursive = true;
	# };
}

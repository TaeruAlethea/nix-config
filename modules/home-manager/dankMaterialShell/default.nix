{ inputs, pkgs, ... }:
{
	imports = [
		inputs.dankMaterialShell.homeModules.dankMaterialShell.default
		inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
	];

	home.packages = with pkgs; [
		wl-clipboard
	];

	programs.dankMaterialShell.enable = true;

	xdg.configFile."DankMaterialShell/" = {
	  source = ./config;
	  recursive = true;
	};
}

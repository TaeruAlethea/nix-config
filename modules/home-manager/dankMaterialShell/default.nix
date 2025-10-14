{ inputs, ... }:
{
	imports = [
		inputs.dankMaterialShell.homeModules.dankMaterialShell.default
		inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
	];

	programs.dankMaterialShell.enable = true;

	xdg.configFile."DankMaterialShell/" = {
	  source = ./config;
	  recursive = true;
	};
}

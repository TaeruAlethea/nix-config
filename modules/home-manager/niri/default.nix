{ inputs, ... } :
{
	imports = [
		inputs.niri.homeModules.niri
		inputs.dankMaterialShell.homeModules.dankMaterialShell.default
		inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
	];

	programs.dankMaterialShell.enable = true;

	xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

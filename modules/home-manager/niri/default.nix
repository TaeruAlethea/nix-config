{ inputs, outputs, ... } :
{
	imports = [
		inputs.niri.homeModules.niri
		inputs.dankMaterialShell.homeModules.dankMaterialShell.niri

		outputs.homeManagerModules.walker
		outputs.homeManagerModules.waybar
	];

	programs.dankMaterialShell.enable = true;

	xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

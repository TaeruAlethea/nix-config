{ inputs, outputs, ... } :
{
	imports = [
		# inputs.niri.homeManagerModules.default

		outputs.homeManagerModules.walker
		outputs.homeManagerModules.waybar
	];

	xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

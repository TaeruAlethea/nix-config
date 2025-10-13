{ inputs, outputs, ... } :
{
	imports = [
		# inputs.niri.homeManagerModules.default

		outputs.homeManagerModules.walker
		outputs.homeManagerModules.waybar
	];

	outputs.homeManagerModules.waybar = {
		displayManager = "niri";
	};

	xdg.dotConfig."niri".source = ./config.kdl;
}

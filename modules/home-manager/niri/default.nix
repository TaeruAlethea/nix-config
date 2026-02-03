{ inputs, pkgs, ... } :
{
	imports = [
		inputs.niri.homeModules.niri
	];

	# xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

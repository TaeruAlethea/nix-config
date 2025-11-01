{ osConfig, inputs, ... } :
let
	configFile = (if ("{$hostName}" == "ares") then ./ares.kdl else ./zeus.kdl);
		
in
{
	imports = [
		inputs.niri.homeModules.niri
	];

	xdg.configFile."niri/config.kdl".source = configFile;
}

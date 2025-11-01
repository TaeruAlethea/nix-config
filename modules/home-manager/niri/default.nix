{ osConfig, inputs, ... } :
let
	supportedHosts = {
		"ares" = ./ares.kdl;
		"zeus" = ./zeus.kdl;
	};
	
	configFile = supportedHosts."${osConfig.networking.hostName}";
in
{
	imports = [
		inputs.niri.homeModules.niri
	];

	xdg.configFile."niri/config.kdl".source = configFile;
}

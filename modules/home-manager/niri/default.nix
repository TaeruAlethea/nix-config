{ osConfig, inputs, ... } :
let
	supportedHosts = {
		"ares" = ./ares.kdl;
		"zeus" = ./zeus.kdl;
	};
	
	configFile = supportedHosts."${osConfig.networking.hostName}";
	# configFile = supportedHosts.ares;

in
{
	imports = [
		inputs.niri.homeModules.niri
	];

	xdg.configFile."niri/config.kdl".source = configFile;
}

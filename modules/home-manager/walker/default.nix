{ inputs, ... } :
{
	imports = [
		inputs.elephant.homeManagerModules.default
	];

	programs.elephant = {
		enable = true;
		installService = true;
	};
	
	services.walker = {
		enable = true;
		systemd.enable = true;
	};
}

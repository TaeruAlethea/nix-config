{ inputs, ... } :
{
	imports = [
		inputs.elephant.homeManagerModules.default
	];
	
	services.walker = {
		enable = true;
		systemd.enable = true;
	};
}

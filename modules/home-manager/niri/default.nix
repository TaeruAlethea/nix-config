{ outputs, ... } :
{
	imports = [
		outputs.homeManagerModules.walker
		outputs.homeManagerModules.waybar
	];
	
	programs.niri = {
	  enable = true;
	};
}

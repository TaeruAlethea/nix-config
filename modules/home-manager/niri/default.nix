{ outputs, ... } :
{
	imports = [
		outputs.homeManager.walker
		outputs.homeManager.waybar
	];
	
	programs.niri = {
	  enable = true;
	};
}

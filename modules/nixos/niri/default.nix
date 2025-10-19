{ inputs, pkgs, ... } :
{
	nixpkgs.overlays = [ inputs.niri.overlays.niri ];
	programs.niri.package = pkgs.niri-unstable;

	programs.niri = {
	  enable = true;
	};

	environment.systemPackages = with pkgs; [
		xwayland-satellite
	];

	environment.sessionVariables = {
		DISPLAY = ":0";
	};
}

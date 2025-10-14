{ inputs, pkgs, ... } :
{
	nixpkgs.overlays = [ inputs.niri.overlays.niri ];

	programs.niri = {
	  enable = true;
	  package = pkgs.niri-unstable;
	};

	environment.systemPackages = with pkgs; [
		xwayland-satellite
	];

	environment.sessionVariables = {
		DISPLAY = ":0";
	};
}

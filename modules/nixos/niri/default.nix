{ inputs, pkgs, ... } :
{
	nixpkgs = {
		overlays = [
			inputs.niri.overlays.niri
			# Memory leak in mesa. Last known good version is 25.1.7
			# # https://gitlab.freedesktop.org/mesa/mesa/-/issues/13780
			(final: prev: {
				mesa =
					(builtins.getFlake "github:NixOS/nixpkgs/7c7fa70f697b01bb00fa9cc1132c51315836ad5c")
					.legacyPackages.${pkgs.system}.mesa;
			})
		];
	};

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

{ self, inputs, config, ... }: {
	flake.nixosModules.niri = { pkgs, ... } :
	{
		nixpkgs.overlays = [ inputs.niri.overlays.niri ];
		programs.niri.package = pkgs.niri-unstable;

		systemd.user.services.niri-flake-polkit.enable = false;

		programs.niri = {
			enable = true;
		};

		environment.systemPackages = with pkgs; [
			xwayland-satellite
		];

		environment.sessionVariables = {
			DISPLAY = ":0";
		};
	};
}

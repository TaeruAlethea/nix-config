{ inputs, pkgs, lib, osConfig, ... }:
{
	flake.modules.nixos.niri = {
			nixpkgs.overlays = [ inputs.niri.overlays.niri ];
			programs.niri = {
				enable = true;
				package = pkgs.niri-unstable;
			};
			
			systemd.user.services.niri-flake-polkit.enable = false;
			
			environment.systemPackages = with pkgs; [
				xwayland-satellite
				nautilus
				image-roll
			];

			# environment.sessionVariables = {
			# 	DISPLAY = ":0";
			# };
		};

	flake.modules.homeManager.niri = 
	{
		imports = [
			inputs.niri.homeModules.niri
		];

		home.packages = with pkgs; [
			jq # needed for Artemis. Not bad to have around
			brightnessctl
		];

		programs.niri.settings = lib.recursiveUpdate
			(import ./_${osConfig.networking.hostName}.nix)
			(import ./_commonConfig.nix);
	};
}

{ inputs, pkgs, lib, osConfig, ... }:
{
	flake-file.inputs.niri = {
		url = "github:sodiboo/niri-flake";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	flake.modules.nixos.niri = {
			nixpkgs.overlays = [ inputs.niri.overlays.niri ];
			programs.niri.package = pkgs.niri-unstable;

			systemd.user.services.niri-flake-polkit.enable = false;

			programs.niri = {
				enable = true;
			};

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

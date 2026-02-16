{ inputs, lib, ... }: {
	flake.homeModules.niri = { pkgs, osConfig, ... } :
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

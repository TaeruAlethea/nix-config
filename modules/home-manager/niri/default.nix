{ inputs, pkgs, osConfig, ... } :
{
	imports = [
		inputs.niri.homeModules.niri
	];

	programs.niri.settings = "./${osConfig.hostname}.nix";
}

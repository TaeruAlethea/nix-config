{ inputs, ... }: {
	flake.homeModules.niri = { pkgs, osConfig, ... } :
	{
		imports = [
			inputs.niri.homeModules.niri
		];

		programs.niri.settings = import ./${osConfig.networking.hostName}.nix;
	};
}

{ self, inputs, config, osConfig, ... }: {
	flake.homeModules.niri = { pkgs, osConfig, ... } :
	{
		imports = [
			inputs.niri.homeModules.niri
		];

		programs.niri.settings = import ./artemis.nix;
	};
}

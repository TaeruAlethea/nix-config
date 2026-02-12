{ inputs, lib, ... }: {
	flake.homeModules.niri = { pkgs, osConfig, ... } :
	{
		imports = [
			inputs.niri.homeModules.niri
		];

		programs.niri.settings = lib.recursiveUpdate
			(import ./_${osConfig.networking.hostName}.nix)
			(import ./_commonBinds.nix);
	};
}

{
	outputs,
	...
}:
{
	programs.home-manager.enable = true;

	# Only define universal things.
	# core terminal tooling, themes, etc.

	imports = [
		outputs.homeManagerModules.helix
		outputs.homeManagerModules.oh-my-posh
		outputs.homeManagerModules.stylix
	];

	nixpkgs.config.allowUnfree = true; # You get used to this, so always have it.

	home = {
		username = "astraeaf";
		homeDirectory = "/home/astraeaf";
	};

	programs = {
		bash.enable = true;
		gh.enable = true;
		gh-dash.enable = true;
		git.enable = true; # need to refactor the HM Module
		lazygit.enable = true;
	};

	systemd.user.startServices = "sd-switch";
	home.stateVersion = "25.05";
}

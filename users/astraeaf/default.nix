{ outputs, ... }:
{
	programs.home-manager.eneable = true;

	# Only define universal things.
	# core terminal tooling, themes, etc.

	imports = [
		outputs.homeManagerModules.oh-my-posh
	];

	nixpks.config.allowUnfree = true; # You get used to this, so always have it.

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


	systemd.users.startServices = "sd-switch";
	home.stateVersions = "25.05";
}

{ inputs, ... }:
{
	flake.modules.nixos.system_ares = {
		networking = {
			hostName = "ares";
			networkmanager.enable = true;
		};
	

	imports = with inputs.self.modules.nixos; [
		system_base
		window-manager
		audio
		powerManagement

		communications
		terminal
	];
};

	flake.modules.homeManager.system_ares = { pkgs, ... }:{
		imports = with inputs.self.modules.homeManager; [
			system_base
			window-manager
			audio
		];

		home.packages = with pkgs; [
			blender
			gimp3-with-plugins
			krita
			vlc
		];
	};
}

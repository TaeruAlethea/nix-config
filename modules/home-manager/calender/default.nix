{ ... }: {
	flake.homeModules.calendar = { pkgs, ... }: {
	  # Home packages & programs
	  home.packages = with pkgs; [ khal ];

	  services.vdirsyncer.enable = true;
	};
}

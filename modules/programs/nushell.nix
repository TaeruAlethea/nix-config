{ ... }:{
	flake.modules.homeManager.nushell = { ... }: {
		programs = {
			nushell = {
				enable = true;
			};

			# Intigrations
			lazygit.enableNushellIntegration = true;
			oh-my-posh.enableNushellIntegration = true;
			yazi.enableNushellIntegration = true;
		};
		home.shell.enableNushellIntegration = true;
	};
}

{ ... }: {
	flake.modules.homeModules.ghostty = {
		programs.ghostty = {
			enable = true;
		};
	};
}

{ ... }: {
	flake.homeModules.vesktop = { pkgs, ... } :
	{
		home.packages = with pkgs; [
				vesktop
				hunspell # Needed for spell checking?
			];
	};
}

{ inputs, ... }: {
	flake.homeModules.vesktop = { pkgs, ... } :
	{
		imports = [ inputs.nixcord.homeModules.nixcord ];
		
		programs.nixcord = {
    	enable = true;

    # Choose your client (enable only one of these two)
    # discord.vencord.enable = true;      # Standard Vencord
    # discord.equicord.enable = true;   # Equicord (has more plugins)

    # Or these
    vesktop.enable = true;
    # dorion.enable = true;

    # Theming
    # quickCss = "/* css goes here */";
    config = {
    	enabledThemes = [
    		"dms-midnight"
    	];
      # useQuickCss = true;
      # themeLinks = [
      #   "https://raw.githubusercontent.com/link/to/some/theme.css"
      # ];
      frameless = true;

      plugins = {
        # hideAttachments.enable = true;
        # ignoreActivities = {
        #   enable = true;
        #   ignorePlaying = true;
        #   ignoredActivities = [
        #     { id = "game-id"; name = "League of Legends"; type = 0; }
        #   ];
        # };
      };
    };
  };
	};
}

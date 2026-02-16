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
    	useQuickCss = true;    	
    	enabledThemes = [
    		"dank-discord.css"
    	];
    	frameless = true;
    	transparent = true;

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
    quickCss = ''
    		div[aria-label="Send a gift"] { display: none !important; }
				div[aria-label="Open sticker picker"] { display: none !important; }
				div[aria-label="Open GIF picker"] { display: none !important; }
				div[aria-label="Apps"]{ display:none !important; }
				//[class*=channelTextArea] [class*=buttons]>div:not(:nth-child(5)){ display:none !important; }

				body{
				    --gap: 8px;
				    --transparency-tweaks: on;
				    --remove-bg-layer: on;
				    --panel-blur: on;
				    --blur-amount: 12px
				}
  		'';
  };
	};
}

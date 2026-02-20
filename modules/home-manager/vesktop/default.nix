{ inputs, ... }: {
	flake.homeModules.vesktop = { pkgs, ... } :
	{
		imports = [ inputs.nixcord.homeModules.nixcord ];

		home.shellAliases = {
			Oxicord = "nix run github:linuxmobile/oxicord";
		};
		
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
        alwaysExpandRoles.enable = true;
        BlurNSFW.enable = true;
        crashHandler.enable = true;
        platformIndicators.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
        
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

    # https://github.com/refact0r/midnight-discord/blob/master/themes/midnight.theme.css
    quickCss = ''
div[aria-label="Send a gift"] { display: none !important; }
div[aria-label="Open sticker picker"] { display: none !important; }
div[aria-label="Open GIF picker"] { display: none !important; }
div[aria-label="Apps"]{ display:none !important; }
body{
    --custom-window-controls: off;
    
    --gap: 8px;
    --transparency-tweaks: on;
    --remove-bg-layer: on;
    --panel-blur: on;
    --blur-amount: 12px;
}
  		'';
  };
	};
}

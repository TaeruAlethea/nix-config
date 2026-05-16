{ ... }:{
	flake.modules.nixos.nushell = { pkgs, ... }: {
		      users.defaultUserShell = pkgs.nushell;
		      documentation.man.cache.enable = false; #needed for Fish autocompletes
		      };
	
	flake.modules.homeManager.nushell = { pkgs, ... }: {
    home.sessionVariables.SHELL = "nu";		
		programs = {
			nushell = {
				enable = true;

				extraConfig = ''
       let carapace_completer = {|spans|
       carapace $spans.0 nushell ...$spans | from json
       }
       $env.config = {
        show_banner: false,
        completions: {
        case_sensitive: false # case-sensitive completions
        quick: true    # set to false to prevent auto-selecting completions
        partial: true    # set to false to prevent partial filling of the prompt
        algorithm: "prefix"    # prefix or fuzzy
        external: {
        # set to false to prevent nushell looking into $env.PATH to find more suggestions
            enable: true 
        # set to lower can improve completion performance at the cost of omitting some options
            max_results: 100 
            completer: $carapace_completer # check 'carapace_completer' 
          }
        }
       } 
       $env.PATH = ($env.PATH | 
       split row (char esep) |
       prepend /home/myuser/.apps |
       append /usr/bin/env
       )
       $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
       '';
       shellAliases = {
       vi = "hx";
       vim = "hx";
       nano = "hx";
       };
};
       carapace ={
       	enable = true;
       	enableNushellIntegration = true;
       	enableFishIntegration = true;
       };
       fish = {
       	enable = true;
       	generateCompletions = true;
       };
	

			# Intigrations
			lazygit.enableNushellIntegration = true;
			oh-my-posh.enableNushellIntegration = true;
			yazi.enableNushellIntegration = true;
		};
		home.shell.enableNushellIntegration = true;
	};
}

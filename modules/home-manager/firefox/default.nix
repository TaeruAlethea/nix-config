{ ... }: {
	flake.homeModules.firefox = { pkgs, ... }: {
		programs.firefox = {
			enable = true;
			package = pkgs.firefox-beta;
			
			profiles."default" = {
				isDefault = true;
				settings = {
					"browser.tabs.allow_transparent_browser" = true;
				};
				userChrome = ''
					:root {
  					--in-content-page-background: #00000000 !important;
  					--in-content-box-background: #00000088 !important;
					}'';
			};
		};
	};
}

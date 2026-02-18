{ withSystem, inputs, ... }: {
	flake.homeModules.firefox = { pkgs, ... }: {
		programs.firefox = {
			enable = true;
			package = pkgs.firefox-beta;
			
			profiles."default" = {
				isDefault = true;
				settings = {
					"browser.tabs.allow_transparent_browser" = true;
					"sidebar.verticalTabs" = true;
					"extensions.autoDisableScopes" = 0;
				};
				
				userChrome = ''
					:root {
  					--in-content-page-background: #00000000 !important;
  					--in-content-box-background: #00000088 !important;
					}'';
				
				extensions = {
					packages = with inputs.firefox-addons.packages."${withSystem pkgs.stdenv.hostPlatform.system}"; [
						adnauseam
						bitwarden
						privacy-badger
						shinigami-eyes
						sponsorblock
						tampermonkey
					];
				};
			};
		};
	};
}

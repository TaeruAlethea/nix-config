{ inputs, ... }: {
	flake.homeModules.firefox = { pkgs, system, ... }: {
		programs.firefox = {
			enable = true;
			package = pkgs.firefox-beta;
			
			profiles."default" = {
				isDefault = true;
				settings = {
					"browser.tabs.allow_transparent_browser" = true;
					"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
					"sidebar.verticalTabs" = true;
					"extensions.autoDisableScopes" = 0;
				};
				
				# userChrome = ./userChrome.css;

				extensions = {
					packages = with inputs.firefox-addons.packages.${system}; [
						adnauseam
						bitwarden
						privacy-badger
						shinigami-eyes
						sponsorblock
						# tampermonkey
					];
				};
			};
		};
	};
}

{ pkgs, ... }:
{
	flake.modules.nixos.defaultFonts = {
		fonts = {
			packages = with pkgs; [
				# Fallback Fonts
				nerd-fonts.jetbrains-mono
				nerd-fonts.symbols-only

				noto-fonts
				noto-fonts-cjk-sans
				noto-fonts-cjk-serif
				noto-fonts-color-emoji
				noto-fonts-monochrome-emoji
			];
			fontDir.enable = true;

			fontconfig = {
				enable = true;
					defaultFonts = {
						emoji = [
							"Noto Color Emoji"
							"Noto Emoji"
						];
						monospace = [ "JetBrainsMono" ];
						serif = [ "Noto Serif" ];
						sansSerif = [ "Noto Sans" ];
					};
				};
			};
		};

	flake.modules.nixos.localization = {
		# Set your time zone.
		time.timeZone = "America/New_York";

		environment.variables = {
		  LANGUAGE = "en_US";
		};

		# Select internationalisation properties.
		i18n.defaultLocale = "en_US.UTF-8";

		i18n.extraLocaleSettings = {
			LC_ADDRESS = "en_US.UTF-8";
			LC_IDENTIFICATION = "en_US.UTF-8";
			LC_MEASUREMENT = "en_US.UTF-8";
			LC_MONETARY = "en_US.UTF-8";
			LC_NAME = "en_US.UTF-8";
			LC_NUMERIC = "en_US.UTF-8";
			LC_PAPER = "en_US.UTF-8";
			LC_TELEPHONE = "en_US.UTF-8";
			LC_TIME = "en_DK.UTF-8";
		};
	};
}

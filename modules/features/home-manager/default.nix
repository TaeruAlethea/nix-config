{ inputs, osConfig, pkgs, ... }:
let
	 userName = "astraeaf"; 
in
{
	flake.modules.nixos.home-manager =
	{
		home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			backupFileExtension = "bk";
			overwriteBackup = true;
			users.${userName}.imports = with inputs.self.modules.homeManager; [
				("user_${userName}")
				("host_${osConfig.networking.hostName}")
			];
		};
	};

	flake.modules.homeManager."user_${userName}" = {
		programs.home-manager.enable = true;

	  home = {
	    username = "${userName}";
	    homeDirectory = "/home/${userName}";

			sessionVariables = {
	      BROWSER = "firefox";
	      TERMINAL = "wezterm";
	      XCURSOR_SIZE = 36;
	    };

	    pointerCursor = {
		    gtk.enable = true;
		    x11.enable = true;
		    hyprcursor.enable = true;
		    package = pkgs.vimix-cursors;
		    # [
		      # graphite-cursors
		      # layan-cursors
		      # lyra-cursors   # LyraS-cursors"
		      # vimix-cursors
		      # afterglow-cursors-recolored
		    # ];
  
		    name = "Vimix-cursors";
		    size = 36;
		  };
		};

	  xdg.enable = true;

	  programs = {
	    bash.enable = true;
	    gh.enable = true;
	    gh-dash.enable = true;
	    git.enable = true; # need to refactor the HM Module
	    lazygit.enable = true;
	    yazi.enable = true;
	  };

	  systemd.user.startServices = "sd-switch";
	  home.stateVersion = "25.05";
	};

	flake.modules.homeManager.host_zeus = {
		users.${userName}.imports = with inputs.self.modules.homeManager; [
			dankMaterialShell
			elgato
			firefox
			helix
			niri
			oh-my-posh
			wezterm
			vesktop
		];

		# Home packages & programs
		home.packages = with pkgs; [
			bitwarden-desktop
			bitwarden-cli
			bottles

			blender
			gimp3-with-plugins
			gitkraken
			vlc

			obsidian
			zoom-us

			#games
			modrinth-app
			prismlauncher
			vintagestory
			xivlauncher

			easyeffects

			#dev
			jetbrains.rider
			# jdk25_headless
			jdk21_headless
			# jdk17_headless
			# jdk8_headless
		];
	};

	flake.modules.homeManager.host_artemis = {
		users.${userName}.imports = with  inputs.self.modules.homeManager; [
			calendar
			dankMaterialShell
			helix
			niri
			oh-my-posh
			wezterm
			vesktop
		];

		# Home packages & programs
		home.packages = with pkgs; [
			gimp3-with-plugins
			vlc

			firefox-beta
			obsidian
			zoom-us
			# protonmail-desktop # Doesn't Work as expected.

			#games
			modrinth-app
			prismlauncher
			vintagestory
			xivlauncher

			easyeffects

			#dev
			jetbrains.rider
			# jdk25_headless
			jdk21_headless
			# jdk17_headless
			# jdk8_headless
		];
	};
}

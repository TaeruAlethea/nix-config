{ ... }: {
  flake.nixosModules.steam = { pkgs, ... }:
	{
		programs.gamescope = {
			enable = true;
			capSysNice = true;
		};
	
		programs.steam = {
			enable = true;
			extest.enable = true;
			gamescopeSession.enable = true;
		
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
			localNetworkGameTransfers.openFirewall = true;
			extraCompatPackages = with pkgs; [
  			proton-ge-bin
			];
		};

		users.users.astraeaf.packages = with pkgs; [
			steamtinkerlaunch
    ];

		
		environment.systemPackages = with pkgs; [
			protonup-qt
		];

	  environment.sessionVariables = {
		  SDL_VIDEODRIVER = "wayland";
	  };

	};
}

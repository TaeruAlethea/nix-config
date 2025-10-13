{ ... }:
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
	};
}
 

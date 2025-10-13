{ ... }:
{
	programs.gamescope.enable = true;
	
	programs.steam = {
		enable = true;
		extest.enable = true;
		gamescopeSession = true;
		
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
	};
}
 

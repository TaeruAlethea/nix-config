{ ... }: {
	flake.nixosModules.valent = { pkgs, ... } :
	{
		programs.kdeconnect = {
			enable = true;
			package = pkgs.valent;
		};
		networking.firewall = rec {
			allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
			allowedUDPPortRanges = allowedTCPPortRanges;
		};
	};
}

{ ... }: {
	flake.modules.nixos.ssh = {
		services.openssh = {
			enable = true;
			ports = [ 18420 ];
			settings = {
				PasswordAuthentication = false;
				KbdInteractiveAuthentication = false;
				PermitRootLogin = "no";
				AllowUsers = [ "astraeaf" ];
			};
		};

		services.fail2ban.enable = true;
	};
}

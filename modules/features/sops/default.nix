{ inputs, ... }:
{
	flake.modules.nixos.sops = 
	{
		imports = [
			inputs.sops-nix.nixosModules.sops
		];

		sops = {
			age = {
				sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
			};
			defaultSopsFile = ./secrets/secrets.yaml;
			secrets = {
				"astraeaf-pw" = {};
				"location" = {};
			};
		};
	};
}

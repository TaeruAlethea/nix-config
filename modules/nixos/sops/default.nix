{ inputs, ... }: {
	flake.nixosModules.sops = { pkgs, ... }:
  {
		imports = [
			inputs.sops-nix.nixosModules.sops
		];

		sops = {
			age = {
				sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
				keyFile = "/var/lib/sops-nix/key.txt";
			};
			defaultSopsFile = ./secrets.yaml;
			secrets = {
				"astraeaf-pw" = {};
			};
		};
	};
}

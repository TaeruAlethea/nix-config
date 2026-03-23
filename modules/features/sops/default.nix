{ inputs, ... }:
{
	flake-file.inputs.sops-nix = {
		url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
	
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

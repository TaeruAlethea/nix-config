{ inputs, ... }:
{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.sops =
    { config, ... }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = {
        age = {
          sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
          generateKey = true;
        };
        defaultSopsFile = ./secrets/secrets.yaml;
        secrets = {
          "astraeaf-pw" = {
            owner = config.users.users.astraeaf.name;
          };
          "location" = {
            owner = config.users.users.astraeaf.name;
          };
          "astraeaf-ssh-key" = {
            mode = "0440";
            path = "/home/astraeaf/.ssh/authorized_keys";
            owner = config.users.users.astraeaf.name;
          };
          "clourflare" = {
          };

        };
      };
    };
}

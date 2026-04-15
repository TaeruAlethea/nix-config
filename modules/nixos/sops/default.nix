{ inputs, ... }:
{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  flake.nixosModules.sops =
    { pkgs, ... }:
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
          "astraeaf-pw" = { };
          "location" = { };
        };
      };
    };
}

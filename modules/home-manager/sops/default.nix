{ inputs, config, pkgs, ... }:
{
  imports = [    
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;

    age.keyFile = "/home/astraeaf/.config/sops/age/keys.txt";
    validateSopsFiles = false;

    secrets = {
      "private_keys/github" = {
        path = "/home/astraeaf/.ssh/id_ed25519";
      };
    };
  };
}

{
  imports = [    
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "/home/astraeaf/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/github" = {
        path = "/home/astraeaf/.ssh/id_ed25519";
      };
    };
  };
}
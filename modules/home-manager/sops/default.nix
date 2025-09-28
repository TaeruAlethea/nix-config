{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = (inputs.self + /secrets/secrets.yaml);
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/astraeaf/.config/sops/age/keys.txt";
    validateSopsFiles = false;

    secrets = {
      "private_keys/github" = {
        path = "/home/astraeaf/.ssh/id_ed25519";
      };
    };
  };
}

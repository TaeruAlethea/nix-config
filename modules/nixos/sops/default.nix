{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [ inputs.agenix.nixosModules.default ];

  environment.systemPackages = with pkgs; [
    age
    sops
  ];

  sops = {
    defaultSopsFile = (inputs.self + /secrets/secrets.yaml);
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets = {
      github = { };
      astraeaf-password.neededForUsers = true;
      astraeaf-password2.neededForUsers = true;
    };
  };
}

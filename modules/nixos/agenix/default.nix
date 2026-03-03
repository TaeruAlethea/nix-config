{ inputs, ... }: {
	flake.nixosModules.secretsManagement = { pkgs, config, ... }:
  {
    imports = [
        inputs.agenix.nixosModules.default
        inputs.agenix-rekey.nixosModules.default
    ];

    age = {
      identityPaths = [ "/home/astraeaf/.ssh/id_ed25519" ]; # isn't set automatically for some reason

      secrets.secret1 = {
        rekeyFile = ./secrets/secret1.age;
        owner = "astraeaf";
      };

      rekey = {
        hostPubkey = "_${config.networking.hostName}.pub";
        masterIdentities = [ "_astraeaf.pub" ];
        storageMode = "local";
        localStorageDir = (inputs.self + "/secrets/rekeyed/${config.networking.hostName}");
      };
    };
  };
}

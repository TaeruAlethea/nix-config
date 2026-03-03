{ inputs, ... }: {
	flake.nixosModules.secretsManagement = { pkgs, config, ... }:
  {
    imports = [
        inputs.agenix.nixosModules.default
        inputs.agenix-rekey.nixosModules.default
    ];

    services.pcscd.enable = true;
    programs.yubikey-manager.enable = true;

    age = {
      identityPaths = [ "/home/astraeaf/.ssh/id_ed25519" ]; # isn't set automatically for some reason

      secrets.secret1 = {
        rekeyFile = (inputs.self + /secrets/secret2.age);
        owner = "astraeaf";
      };

      rekey = {
        hostPubkey = "_${config.networking.hostName}.pub";
        masterIdentities = [ ./_astraeaf.txt ];
        storageMode = "local";
        localStorageDir = (inputs.self + "/secrets/rekeyed/${config.networking.hostName}");
      };
    };
  };
}

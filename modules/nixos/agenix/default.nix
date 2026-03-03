{ inputs, ... }: {
	flake.nixosModules.agenix = { pkgs, config, ... }:
  {
    environment.systemPackages = with pkgs; [
	    age

	    inputs.agenix.packages."${stdenv.hostPlatform.system}".default
    ];

    age = {
      identityPaths = [ "/home/astraeaf/.ssh/id_ed25519" ]; # isn't set automatically for some reason

      secrets.secret1 = {
        file = (inputs.self + /secrets/secret1.age);
        owner = "astraeaf";
      };
    };

    # age.rekey = {
    #   hostPubkey = "_${config.networking.hostName}.pub";
    #   storageMode = "local";
    #   localStorageDir = ./. + "/secrets/rekeyed/${config.networking.hostName}";
    # };
  };
}

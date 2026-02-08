{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    age

    inputs.agenix.packages."${system}".default
  ];

  age = {
    identityPaths = [ "/home/astraeaf/.ssh/id_ed25519" ]; # isn't set automatically for some reason

    secrets.secret1 = {
      file = (inputs.self + /secrets/secret1.age);
      owner = "astraeaf";
    };
  };
}

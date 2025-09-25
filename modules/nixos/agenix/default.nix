{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages."${system}".default
  ];


  age ={
    identityPaths = [ "~/.ssh/id_ed25519" ]; # isn't set automatically for some reason

    secrets.secret1 ={
        file = ( inputs.self + /secrets/secret1.age );
        owner = "astraeaf";
    };
  };
}

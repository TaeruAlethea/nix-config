{ ... }:
{
  flake.homeModules.albionOnline =
    { pkgs, ... }:
    {
      home.packages =
        let
          albionOnline = pkgs.callPackage ./_derivation.nix { };
        in
        [
          albionOnline
        ];
    };
}

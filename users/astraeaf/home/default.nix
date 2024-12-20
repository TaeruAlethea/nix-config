{ home-manager, ... }:
{
  "astraeaf@ares" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    modules = [
      ./ares.nix
    ];
  };

  "astraeaf@artemis" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    modules = [
      ./artemis.nix
    ];
  };
}

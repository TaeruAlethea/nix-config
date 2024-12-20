{
  inputs,
  outputs,
  nixpkgs,
  home-manager,
  ...
}:
{
  ares = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs outputs; };
    modules = [
      # > Our main nixos configuration file <
      ./ares/configuration.nix
      (inputs.self + /users/astraeaf/nixos/ares.nix)

      #home-manager.nixosModules.home-manager
      #{
      #  home-manager.useGlobalPkgs = true;
      #  home-manager.useUserPackages = true;
      #  home-manager.extraSpecialArgs = { inherit inputs outputs; };

      #  home-manager.users.astraeaf = import (inputs.self + /users/astraeaf/hosts/ares.nix);
      #}
    ];
  };

  artemis = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs outputs;
    };
    modules = [
      ./artemis/configuration.nix
      (inputs.self + /users/astraeaf/nixos/artemis.nix)

      #home-manager.nixosModules.home-manager
      #{
      #  home-manager.useGlobalPkgs = true;
      #  home-manager.useUserPackages = true;
      #  home-manager.extraSpecialArgs = {
      #    inherit inputs outputs;
      #  };

      #  home-manager.users.astraeaf = import (inputs.self + /users/astraeaf/hosts/artemis.nix);
      #}
    ];
  };
}

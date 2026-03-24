{ inputs, ...}: {
  flake.nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with inputs.self.modules.nixos; [
      ./_nixos.nix
      
      sops
      defaultFonts
      localization
      niri
      shellAliases
      steam
      home-manager
    ];
  };
}

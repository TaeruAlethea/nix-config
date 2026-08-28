{ inputs, ... }:
{
  flake.nixosConfigurations.artemis = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      {
        networking = {
          hostName = "artemis";
          networkmanager.enable = true;
        };

        imports = with inputs.self.modules.nixos; [
          hardware_artemis # hardware-config.nix

          user_astraeaf
        ]
        ++ (with inputs.self.modules.nixos; [
          system_base
          window-manager
          audio
          powerManagement
          razer

          communications
          gaming
          terminal
        ]);
      }
    ];
  };
}

{ inputs, ... }:
{
  flake.nixosConfigurations.zeus = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      {
        networking = {
          hostName = "zeus";
          networkmanager.enable = true;
        };
  
        imports = with inputs.self.modules.nixos; [
          system_base
          hardware_zeus
          nvidia

          user_astraeaf

          window-manager
          audio
          powerManagement
          razer

          communications
          gaming
          septabee-daw
          terminal
          valent
          vr
        ];
      }
    ];
  };
}

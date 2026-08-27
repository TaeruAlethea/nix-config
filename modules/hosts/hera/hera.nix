{ inputs, ... }:
{
  flake.nixosConfigurations.hera = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      {
        networking = {
          hostName = "hera";
          networkmanager.enable = true;
        };

        
        imports = with inputs.self.modules.nixos; [
          system_base
          hardware_hera

          user_astraeaf

          powerManagement
          sshServer
          xmppServer
        ];
      }
    ];
  };
}

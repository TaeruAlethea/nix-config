{ inputs, ... }:
{
  flake.modules.nixos.secretsManagement = {
    imports = with inputs.self.modules.nixos; [
      sops
    ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

  };
}

{ inputs, ... }:
{
  flake.modules.nixos.terminal =
    { ... }:
    {
      environment.shellAliases = {
        RestartSound = "systemctl restart --user wireplumber";
      };

    imports = with inputs.self.modules.nixos; [
      nushell
    ];
      
    };

  flake.modules.homeManager.terminal = { ... }: {
       programs.carapace.enable = true;
       programs.carapace.enableBashIntegration = true;
     
    imports = with inputs.self.modules.homeManager; [
      helix
      oh-my-posh
      nushell
    ];
  };
}

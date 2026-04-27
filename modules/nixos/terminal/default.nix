{ inputs, ... }:
{
  flake.modules.nixos.terminal =
    { ... }:
    let
      myShellAliases = {
        RestartSound = "systemctl restart --user wireplumber";
      };
    in
    {
      environment.shellAliases = myShellAliases;
    };

  flake.modules.homeManager.terminal = { ... }: {
    imports = with inputs.self.modules.homeManager; [
      helix
      oh-my-posh
      nushell
    ];
  };
}

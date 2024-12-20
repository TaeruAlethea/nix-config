{ lib, pkgs, ... }:
{
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = builtins.fromJSON (
      builtins.unsafeDiscardStringContext (
        builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/uew.omp.json"
      )
    );
    # settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/uew"));
  };
}

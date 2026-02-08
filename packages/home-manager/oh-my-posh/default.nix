{ lib, inputs, ... }:
let
  configPath = (inputs.self + "/modules/home-manager/oh-my-posh/foxxo_dark.omp.json");
in
{
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile configPath));
    #useTheme = "sonicboom_dark";
  };
}

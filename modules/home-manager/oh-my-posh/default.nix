{ lib, inputs, ... }:
let
    configPath = ( inputs.self + "/modules/home-manager/oh-my-posh/uew.omp.json" );
in
{
    programs.oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile configPath));
    };
}

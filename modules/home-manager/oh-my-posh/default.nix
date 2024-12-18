{ lib, ... }:
{
    programs.oh-my-posh = lib.mkForce {
        enable = true;
        enableBashIntegration = true;
        useTheme = "./uew.omp.json";
    };
}
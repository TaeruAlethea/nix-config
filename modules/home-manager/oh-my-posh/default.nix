{ lib, ... }:
{
    programs.oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        useTheme = "./uew.omp.json";
    };
}
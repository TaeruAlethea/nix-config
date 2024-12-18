{ lib, ... }:
{
    programs.oh-my-posh = lib.mkForce {
        enable = true;
        enableBashIntegration = true;
        useTheme = "https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/velvet.omp.json";
    }
}
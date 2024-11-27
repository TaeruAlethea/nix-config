{ config, pkgs, ... }:{
  programs.kitty = {
    enable = true;
    font.size = 18;
    shellIntegration.enableBashIntegration = true;
  };
}
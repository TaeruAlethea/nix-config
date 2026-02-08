{ ... }: {
  perSystem.packages.oh-my-posh = { lib, ... }: {
    programs.oh-my-posh = {
      enable = true;
      enableBashIntegration = true;
      settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./foxxo_dark.omp.json));
      #useTheme = "sonicboom_dark";
    };
  };
}
{ inputs, ... }:
{
  # These modules will always be active

  flake.modules.nixos.system_base =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        home-manager
        secretsManagement

        defaultFonts
        localization
      ];
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        helix # falesafe editor
        treefmt # Nix formatter
      ];

      services = {
        gvfs.enable = true;
        udisks2.enable = true;

      };

      security = {
        rtkit.enable = true;
        polkit.enable = true;
      };

      nix.settings = {
        auto-optimise-store = true;

        # enable the flake "experimental" feature, needed for the config to work.
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      system.stateVersion = "25.05";
    };

  flake.modules.homeManager.system_base =
    { config, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        helix
        oh-my-posh
        gitToolChain
      ];

      programs.home-manager.enable = true;
      xdg.enable = true;

      systemd.user.startServices = "sd-switch";
      home = {
        homeDirectory = "/home/${config.home.username}";
        stateVersion = "25.05";
        sessionVariables = {
          EDITOR = "hx";
        };
      };
    };
}

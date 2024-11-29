{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    
    map (x:homeManagerSettings + x) [
      /fonts
      /hyprland
      /git
      /sops
      /ssh
      /waybar
      #/emacs
    ];
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "astraeaf";
    homeDirectory = "/home/astraeaf";
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };

  # Home packages & programs
  home.packages = with pkgs; [
      atool
      httpie
    ];
  programs = {
    home-manager.enable = true; # alwayas enabled

    # Shell & CLI
    bash.enable = true;
    gh.enable = true;
    gh-dash.enable = true;
  };

  # To be made into pacakges
  gtk.enable = true;

  stylix.targets = {
    bemenu.enable = true;
    firefox.enable = true;
    gnome.enable = true;
    gtk.enable = true;
    hyprland.enable = true;
    hyprlock.enable = true;
    kitty.enable = true;
    vscode.enable = true;
    waybar.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}

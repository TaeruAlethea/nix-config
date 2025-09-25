{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  self,
  ...
}:
{
  programs.home-manager.enable = true; # alwayas enabled

  imports = [
    outputs.homeManagerModules.oh-my-posh
    outputs.homeManagerModules.wezterm

    # outputs.homeManagerModules.emacs
    # outputs.homeManagerModules.fonts
    # outputs.homeManagerModules.git
    # outputs.homeManagerModules.hyprland
    # outputs.homeManagerModules.sops
    # outputs.homeManagerModules.ssh
    # outputs.homeManagerModules.stylix
    # outputs.homeManagerModules.waybar
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

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
      allowUnfree = true;
    };
  };

  home = {
    username = "astraeaf";
    homeDirectory = "/home/astraeaf";
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "wezterm";
    };
  };


  rust-bin.stable.latest.default

  # Home packages & programs
  home.packages = with pkgs; [
      bitwarden-desktop
      bitwarden-cli
      bottles

      firefox-beta
      obsidian
      vesktop
      steam

      #dev
      jetbrains.rider
      cargo
      rustc
  ];
  programs = {
    # Shell & CLI
    bash.enable = true;
    gh.enable = true;
    gh-dash.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}

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
  imports = [
    outputs.userConfigs.astraeaf.core

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
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "wezterm";
    };
  };

  # Home packages & programs
  home.packages = with pkgs; [
      bitwarden-desktop
      bitwarden-cli
      bottles

      gitkraken

      firefox-beta
      obsidian
      vesktop
      steam

      #dev
      jetbrains.rider
  ];
  
}

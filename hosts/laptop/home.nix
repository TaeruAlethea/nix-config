{
  config,
  pkgs,
  user,
  inputs,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./../../modules/home-manager/hyprland.nix
    ./../../modules/home-manager/git.nix
    ./../../modules/home-manager/ssh.nix
    ./../../modules/home-manager/waybar.nix
    #./../../modules/home-manager/emacs.nix
  ];

  sops = {
    age.keyFile = "/home/astraeaf/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/github" = {
        path = "/home/astraeaf/.ssh/id_ed25519";
      };
    };
  };

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

  gtk.enable = true;
  programs = {
    home-manager.enable = true;

    # Shell & CLI
    bash.enable = true;
    gh.enable = true;
    gh-dash.enable = true;
  };

  home = {
    stateVersion = "24.05";
    username = "astraeaf";
    homeDirectory = "/home/astraeaf";
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    packages = with pkgs; [
      atool
      httpie

      # Fonts
      jetbrains-mono
      openmoji-black
      openmoji-color

    ];
  };
}

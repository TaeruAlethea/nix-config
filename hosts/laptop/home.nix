{ config, pkgs, user, ... }:{
    imports = [
        ./../../modules/home-manager/hyprland.nix
        ./../../modules/home-manager/git.nix
    ];

  programs = {
    home-manager.enable = true;

    # Shell & CLI
    bash.enable = true;
    };

    home = {
	stateVersion = "24.05";
        username = "astraeaf";
        homeDirectory = "/home/astraeaf";
        sessionVariables = {
            BROWSER = "firefox";
            TERMINAL = "kitty";
        };

        packages = [
            pkgs.atool
            pkgs.httpie
        ];
    };
}

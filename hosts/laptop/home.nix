{ config, pkgs, user, ... }:{
    imports = [
    	inputs.sops-nix.homeManagerModules.sops
        ./../../modules/home-manager/hyprland.nix
        ./../../modules/home-manager/git.nix
	./../../modules/home-manager/ssh.nix
    ];

  sops = {
    age.keyfile = "/home/astraeaf/.config/sops/age/keys.txt";
    defaultSopsfile = ./secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/github" = {
        path = "/home/astraeaf/.ssh/id_ed25519";
      };
    };
  };

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

        packages = [
            pkgs.atool
            pkgs.httpie
        ];
    };
}

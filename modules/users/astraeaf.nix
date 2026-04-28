{ inputs, ... }:
let
  userName = "astraeaf";
  userNameLong = "Astraea Falke";
in
{
  flake.modules.nixos."user_${userName}" =
    { pkgs, config, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        ssh
      ];
      
      users.users."${userName}" = {
        name = "${userName}";
        isNormalUser = true;
        hashedPasswordFile = config.sops.secrets.astraeaf-pw.path;
        description = userNameLong;
        extraGroups = [
          "networkmanager"
          "wheel"
          "openrazer"
          "plugdev"
        ];
       shell = pkgs.nushell; 
       openssh.authorizedKeys.keys = [ (config.sops.secrets.astraeaf-ssh-key.path) ];
     };

      # Enable automatic login for the user.
      services.displayManager.autoLogin.enable = true;
      services.displayManager.autoLogin.user = "${userName}";

      programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        flake = "/home/${userName}/nix-config";
      };

      home-manager.users."${userName}" = {
        imports = [
          inputs.self.modules.homeManager."user_${userName}"
        ];
      };
    };

  flake.modules.homeManager."user_${userName}" =
    { osConfig, pkgs, ... }:
    {
      imports = [
        inputs.self.modules.homeManager."system_${osConfig.networking.hostName}"
      ] ++ (with inputs.self.modules.homeManager; [
        communications
        emacs
        firefox
      ]);

      home.packages = with pkgs; [
        obsidian
        logseq

        fastfetch
      ];

      home = {
        username = "${userName}";
        homeDirectory = "/home/${userName}";
      };

    };
}

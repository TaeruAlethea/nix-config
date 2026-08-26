{ inputs, ... }:
let
  userName = "astraeaf";
  userNameLong = "Astraea Falke";
in
{
  flake.modules.nixos."user_${userName}" =
    { pkgs, config, ... }:
    {
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
      
      home-manager.users."${userName}" = { config, ... }:{
        imports = [
          inputs.self.modules.homeManager."user_${userName}_${config.networking.hostName}"
        ]
        ++ (with inputs.self.modules.homeManager; [
          emacs
          gitToolChain
          terminal
        ]);

        home.packages = with pkgs; [
          fastfetch
        ];

        home = {
          username = "${userName}";
          homeDirectory = "/home/${userName}";
          stateVersion = "26.05";
          sessionVariables = {
            EDITOR = "hx";
          };
        };

        programs.home-manager.enable = true;
        xdg.enable = true;

        systemd.user.startServices = "sd-switch";
      };
    };
}

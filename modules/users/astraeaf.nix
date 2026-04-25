{ inputs, config, ... }:
let
  userName = "astraeaf";
  userNameLong = "Astraea Falke";
in
{
  flake.modules.nixos."user_${userName}" =
    { pkgs, ... }:
    {
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
          inputs.self.modules.homeManger."user_${userName}"
        ];
      };
    };

  flake.modules.homeManager."user_${userName}" = {
    imports = [
      inputs.self.modules.homeManager."system_${config.networking.hostName}"
    ];

    home = {
      username = "${userName}";
      homeDirectory = "/home/${userName}";
    };

  };
}

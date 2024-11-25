{ config, pkgs, users, ... }:{
#  sops.secrets = {
#    "github" = {
#      owner = config.users.users.astraeaf.name;
#      inherit (config.users.users.astraeaf) group;
#    };
#  };

  programs.ssh = {
    enable = true;
    includes = [
      "/home/astraeaf/.ssh/"
    ];
  };
}

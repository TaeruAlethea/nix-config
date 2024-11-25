{ config, pkgs, users, ... }:{
  sops.sectrets = {
    "github" = {
      owner = config.users.users.astraeaf.name;
      inherit (config.users.users.astraeaf) group;
    };
  };

  programs.ssh = {
    enable = true;
    includes = [
      "/home/astraeaf/.ssh/"
    ];
  };
}

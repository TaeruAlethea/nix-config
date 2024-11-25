{ config, pkgs, users, ... }:{
  sops.sectrets = {
    "github" = {
      owner = config.users.users.astraeaf.name;
    };
  };

  programs.ssh = {
    enable = true;
    includes = [
      "/home/astraeaf/.ssh/"
    ];
  };
}

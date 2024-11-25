{ config, pkgs, ... }:{
  sops.sectrets = {
    "github" = {
      owner = config.users.users.astraeaf.name;
      inherit (config.users.users.ta) group;
    };
  };

  programs.ssh = {
    enable = true;
    includes = [
      "/home/astraeaf/.ssh/"
    ];
  };
}

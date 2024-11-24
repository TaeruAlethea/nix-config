{ config, pkgs, ... }:{
  programs.git = {
    enable = true;
    userName = "TaeruAlethea";
    userEmail = "61478538+TaeruAlethea@users.noreply.github.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}

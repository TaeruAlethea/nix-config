{ ... }: {
	flake.modules.homeModules.gitToolchain = {
    programs.git = {
      enable = true;
      # userName = "TaeruAlethea";
      # userEmail = "61478538+TaeruAlethea@users.noreply.github.com";
    };
  };
}

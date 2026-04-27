# Shamelessly ripped from Ghil. https://github.com/glabrie/dotfiles/blob/b4e7b6118a38d1fb6c1dc04048cfdcfbfeebad04/modules/programs/emacs.nix
# It'll porbably diverege pretty aggresively over time, but I want transparency and use Proton too. :D
{ ... }: {
	   flake.modules.homeManager.emacs =
  { pkgs, ... }:
  {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs-pgtk.pkgs.withPackages (e: [
        e.vterm
        e.mu4e
      ]);
    };

    home.packages = [ pkgs.mu pkgs.isync ];

    services = {
      emacs.enable = true;
      mbsync.enable = true;
    };

    systemd.user.services.protonmail-bridge = {
      Unit = {
        Description = "ProtonMail Bridge";
        After = [ "network-online.target" ];
      };
      Service = {
        ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive";
        Restart = "always";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}

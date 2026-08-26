{ inputs, ... }:
{
  flake.modules.homeManager.user_astraeaf_artemis =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        window-manager
        audio

        gaming
        communications
        emacs
        zen-browser
      ];

      # Home packages & programs
      home.packages = with pkgs; [
        blender
        gimp3-with-plugins
        obsidian
        reaper
        vlc
      ];
    };
}

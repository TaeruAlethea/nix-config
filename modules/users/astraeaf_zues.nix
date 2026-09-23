{ inputs, ... }:
{
  flake.modules.homeManager.user_astraeaf_zeus =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        window-manager
        audio
        elgato

        communications
        gaming
        vr
        zen-browser
      ];

      # Home packages & programs
      home.packages = with pkgs; [
        blender
        gimp3
        kicad-small
        obsidian
        reaper
        vlc
      ];
    };
}

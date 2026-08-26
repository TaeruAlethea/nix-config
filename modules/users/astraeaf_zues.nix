{ inputs, ... }:
{
  flake.modules.homeManager.user_astraeaf_zeus =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        system_base
        window-manager
        audio
        elgato

        gaming
        vr
      ];

      # Home packages & programs
      home.packages = with pkgs; [
        blender
        gimp3-with-plugins
        reaper
        vlc
      ];
    };
}

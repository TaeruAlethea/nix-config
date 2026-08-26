{ inputs, ... }:
{
  flake.modules.homeManager.user_astraeaf_ares =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        system_base
        window-manager
        audio

        communications
        zen-browser
      ];

      home.packages = with pkgs; [
        blender
        gimp3-with-plugins
        krita
        obsidian
        vlc
      ];
    };
}

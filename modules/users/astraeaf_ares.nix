{ inputs, ... }:
{
  flake.modules.homeManager.user_astraeaf_ares =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        window-manager
        audio

        communications
        zen-browser
      ];

      home.packages = with pkgs; [
        blender
        gimp3
        krita
        obsidian
        vlc
      ];
    };
}

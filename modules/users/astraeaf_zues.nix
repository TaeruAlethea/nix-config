{ inputs, ... }:
{
  flake.modules.homeManager.user_astraeaf_zeus =
    { pkgs, ... }:
    let
     mixxx = pkgs.mixxx.overrideAttrs (old: {
        qtWrapperArgs =
          (old.qtWrapperArgs or [])
          ++ [
            "--prefix"
            "XDG_DATA_DIRS"
            ":"
            "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
          ];
      });
    in
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
        mixxx
        obsidian
        reaper
        vlc
      ];
    };
}

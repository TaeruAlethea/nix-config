{ ... }:
{
  flake.modules.homeManager.DjAndStream =
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
    home.packages = with pkgs; [
      mixxx
      projectm_3
    ];

		programs.obs-studio = {
			enable = true;

			pacakge = (
				pkgs.obs-studio.override {
					cudaSupport = true;
				}
			);

			plugins = with pkgs.obs-studio-plugs; [
				wlrobs
				obs-aitum-multistream
	      obs-backgroundremoval
	      obs-pipewire-audio-capture
	      obs-gstreamer
	      obs-vkcapture
			];
		};
	};
}

{ lib, ... }:
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

	obs-aitum-stream-suite = pkgs.qt6Packages.callPackage ({ stdenv, fetchFromGitHub, cmake, curl, obs-studio, qtbase, }: stdenv.mkDerivation rec {
	  pname = "obs-aitum-stream-suite";
	  version = "1.2.6";

	  src = fetchFromGitHub {
	    owner = "Aitum";
	    repo = "obs-aitum-stream-suite";
	    tag = version;
	    hash = "sha256-d+fOj3LGKRlqK3gGZ8qrdVl3uaIC3ViGedUfs7VlsFQ=";
	  };

	  # Remove after https://github.com/Aitum/obs-aitum-multistream/pull/15 is released :)
	  # patches = [ ./obs-aitum-multistream.diff ];

	  # Fix FTBFS with Qt >= 6.8
	  # prePatch = ''
	  #   substituteInPlace CMakeLists.txt \
	  #     --replace-fail 'find_qt(COMPONENTS Widgets Core)' 'find_package(Qt6 COMPONENTS Core Widgets)'
	  # '';

	  nativeBuildInputs = [ cmake ];
	  buildInputs = [
	    curl
	    obs-studio
	    qtbase
	  ];
	  dontWrapQtApps = true;

	  cmakeFlags = [
	    # Prevent deprecation warnings from failing the build
	    (lib.cmakeOptionType "string" "CMAKE_CXX_FLAGS" "-Wno-error=deprecated-declarations")
	  ];
	}) { };
	in
  {
    home.packages = with pkgs; [
      mixxx
      projectm_3
    ];

		programs.obs-studio = {
			enable = true;

			package = (
				pkgs.obs-studio.override {
					cudaSupport = true;
				}
			);

			plugins = with pkgs.obs-studio-plugins; [
				wlrobs
				# obs-aitum-multistream
				obs-aitum-stream-suite
				obs-backgroundremoval
	      obs-pipewire-audio-capture
	      obs-gstreamer
	      obs-vkcapture
			];
		};
	};
}

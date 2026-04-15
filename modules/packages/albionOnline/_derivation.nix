{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  unzip,
  ...
}:
stdenv.mkDerivation rec {
  name = "albion-online-launcher-${version}";
  version = "20260413175522";
  src = fetchurl {
    url = "https://live.albiononline.com/clients/${version}/albion-online-setup";
    hash = "sha256-ynI9RglRofEDbNQttBdsxBqMGDzHSaTQTZf5KiYDCps=";
  };
  nativeBuildInputs = [ unzip ];

  unpackPhase = ''
    		unzip -qq $src -d . || true
    	'';

  installPhase = ''
    		mkdir -p $out/albiononline
    		mv data $out/albiononline
    		# install -Dm755 $out/albiononline/Albion-Online "$out/bin/Albion-Online"
    	'';
}

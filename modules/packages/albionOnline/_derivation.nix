{ stdenv, fetchurl, autoPatchelfHook, makeWrapper, ... }: stdenv.mkDerivation rec {
  name = "albion-online-launcher-${version}";
  version = "20260413175522";
  src = fetchurl {
  	url = "https://live.albiononline.com/clients/${version}/albion-online-setup";
  	hash = "";
  };

		nativeBuildInputs = [ autoPatchelfHook makeWrapper ];

		installPhase = ''
			mkdir -p $out
			mv albion-online-setup $out/
		'';
}

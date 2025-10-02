{ appimageTools, fetchurl }:
let
  pname = "opendeck";
  version = "2.6.1";

  src = fetchurl {
    url = "https://github.com/nekename/OpenDeck/releases/download/v${version}/opendeck_${version}_amd64.AppImage";
    sha256 = "sha256:e12f0330d2a6349f8be702b94dc6839af33c10e04a5e0b86641ad6fd10959cd8";
  };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  meta = {
    homepage = "https://github.com/nekename/OpenDeck";
    #license = lib.licenses.gpl3;
  };
}

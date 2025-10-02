{ stdenv, pkgs, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "opendeck";
  version = "2.6.1";

  # src = pkgs.fetchFromGitHub {
  #   owner = "nekename";
  #   repo = "OpenDeck";
  #   tag = "v${version}";
  #   sha256 = "sha256-nI6ZpDdW1pw2FC4XN3q2R1LgYJtu0o47mv8cCDSj0lY=";
  # };

  src = fetchurl {
    url = "https://github.com/nekename/OpenDeck/releases/download/v${version}/opendeck_${version}_amd64.AppImage";
    sha256 = "sha256:e12f0330d2a6349f8be702b94dc6839af33c10e04a5e0b86641ad6fd10959cd8";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp ${pname} $out/bin/
  '';

  #propagatedBuildInputs = [ runTimePackage ];

  meta = {
    homepage = "https://github.com/nekename/OpenDeck";
    #license = lib.licenses.gpl3;
  };
}

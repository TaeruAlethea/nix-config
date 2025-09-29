{ stdenv, pkgs, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "opendeck";
  version = "2.6.0";

  # src = pkgs.fetchFromGitHub {
  #   owner = "nekename";
  #   repo = "OpenDeck";
  #   tag = "v${version}";
  #   sha256 = "sha256-nI6ZpDdW1pw2FC4XN3q2R1LgYJtu0o47mv8cCDSj0lY=";
  # };

  src = fetchurl {
    url = "https://github.com/nekename/OpenDeck/releases/download/v${version}/OpenDeck_x64.app.tar.gz";
    sha256 = "sha256-VujqwKoojy6v9b+XvQTjMyms1ohLRj54VP8UW7GE/Ho=";
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

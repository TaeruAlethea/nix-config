let
  pkgs = import <nixpkgs> { };
in
pkgs.stdenv.mkDerivation (finalAttrs: {  
  pname = "opendeck";
  version = "2.6.0";

  src = pkgs.fetchFromGitHub {
    owner = "nekename";
    repo = "OpenDeck";
    tag = "v${finalAttrs.version}";
    sha256 = "sha256-nI6ZpDdW1pw2FC4XN3q2R1LgYJtu0o47mv8cCDSj0lY=";
  };

  nativeBuildInputs = [ pkgs.makeWrapper pkgs.cargo-tauri ];

  dontBuild = true;

  buildPhase = ''
   ${pkgs.lib.getExe pkgs.deno} task tauri build
  '';

  
  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib}
    makeWrapper ${pkgs.lib.getExe pkgs.deno} $out/bin/opendeck \
      --set DENO_NO_UPDATE_CHECK "1" \
      --add-flags "run -A $out/lib/src/main.ts"

    runHook postInstall
  '';

  meta = {
    homepage = "https://github.com/nekename/OpenDeck";
    #license = lib.licenses.gpl3;
  };
})

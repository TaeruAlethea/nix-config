{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "OpenDeck"; # Name of your package
  version = "2.6.0";          # Version of your package

  src = pkgs.fetchFromGitHub {
    owner = "nekename";  # Replace with the GitHub owner/organization
    repo = "OpenDeck";       # Replace with your repository name
    rev = "bb64d0e81aa3852e4751f262a5f9bea62b233428"; # Or a specific commit hash/tag
    sha256 = "sha256-hash-of-the-source"; # Calculate this hash (see below)
  };

  # Optional: if your buildable code is in a subdirectory
  # sourceRoot = "${src.name}/path/to/subdirectory";

  # Build instructions (e.g., for C++ or Go, this might vary)
  buildPhase = ''
    # Example for C++:
    # make
  '';

  installPhase = ''
    # Example for C++:
    # mkdir -p $out/bin
    # cp my-executable $out/bin/
  '';
}

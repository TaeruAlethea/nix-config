{ inputs, ... }:
{
  flake-file.inputs.treefmt-nix = {
    url = "github:numtide/treefmt-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem.treefmt =
    { pkgs, ... }:
    {
      # Used to find the project root
      projectRootFile = "flake.nix";

      programs = {
        csharpier = true;
        jsonfmt.enable = true;
        jsonnet-lint.enable = true;
        nixfmt.enable = true;
        rustfmt.enable = true;
        yamlfmt.enable = true;
      };
    };
}

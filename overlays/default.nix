# This file defines overlays
{ lib, inputs, ... }:
{
  # use path relative to the root of the project
  # https://github.com/EmergentMind/nix-config/blob/e1984059e129f38c2a348d93b56d99ad01e6aca7/lib/default.nix#L5
  relativeToRoot = lib.path.append ../.;

  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  # When applied, the stable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.stable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}

# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
    # List your module files here
    # my-module = import ./my-module.nix;

    #imports = [
    #    ./hyprland/default.nix
    #    ./localization/default.nix
    #    ./sops/default.nix
    #    ./stylix/default.nix
    #];

    fonts = import ./fonts;
    hyprland = import ./hyprland; #todo: make this work right as a module
    localization = import ./localization;
    sops = import ./sops;
    stylix = import ./stylix;
}

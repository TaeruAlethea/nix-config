{ inputs, ... }:
{
  flake-file.inputs.niri = {
    url = "github:sodiboo/niri-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosModules.niri =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ inputs.niri.overlays.niri ];
      programs.niri.package = pkgs.niri-unstable;

      systemd.user.services.niri-flake-polkit.enable = false;

      programs.niri = {
        enable = true;
        useNautilus = true;
      };

      programs.gnome-disks.enable = true;

      services.gnome = {
        sushi.enable = true;
      };

      environment.systemPackages = with pkgs; [
        xwayland-satellite
        nautilus
        image-roll
      ];

      # environment.sessionVariables = {
      # 	DISPLAY = ":0";
      # };
    };
}

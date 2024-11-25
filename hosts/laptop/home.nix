{ config, pkgs, user, inputs, ... }:
let
	inputImage = /home/astraeaf/Pictures/wallpaper.jpg;
	brightness = -30;
	contrast = 0;
	fillColor = "black";
	theme = "${pkgs.base16-schemes}/share/themes/irblack.yaml";
#	wallpaper = pkgs.runCommand "image.png" {} ''
#		COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${theme})
#		COLOR="#"$COLOR
#		${pkgs.imagemagick}/bin/magick convert -size 1920x1080 xc:$COLOR $out
#	'';
in
{
    imports = [
    	inputs.sops-nix.homeManagerModules.sops
        ./../../modules/home-manager/hyprland.nix
        ./../../modules/home-manager/git.nix
	./../../modules/home-manager/ssh.nix
    ];

  sops = {
    age.keyFile = "/home/astraeaf/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/github" = {
        path = "/home/astraeaf/.ssh/id_ed25519";
      };
    };
  };

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = theme;
#    image = config.lib.stylix.pixel "base0A";
#    image = pkgs.runCommand "dimmed-background.png" { } ''
#      ${pkgs.imagemagick}/bin/convert "${inputImage}" -brightness-contrast ${brightness},${contrast} -fill ${fillColor} $out
#    '';
    image = /home/astraeaf/Pictures/wallpaper.jpg;
  };

  programs = {
    home-manager.enable = true;

    # Shell & CLI
    bash.enable = true;
    gh.enable = true;
    gh-dash.enable = true;
    };

    home = {
	stateVersion = "24.05";
        username = "astraeaf";
        homeDirectory = "/home/astraeaf";
        sessionVariables = {
            BROWSER = "firefox";
            TERMINAL = "kitty";
        };

        packages = [
            pkgs.atool
            pkgs.httpie
        ];
    };
}

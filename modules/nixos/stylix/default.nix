{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/irblack.yaml";
    polarity = "dark";
    image = config.lib.stylix.pixel "base01";
    fonts = {
      sizes = {
        applications = 20;
        desktop = 18;
        popups = 18;
        terminal = 20;
      };
    };
    opacity = {
      applications = 1.0;
      desktop = 0.75;
      popups = 0.9;
      terminal = 0.5;
    };
  };
}

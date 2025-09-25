{ pkgs, config, ... }:
{
  fonts = {
    packages = with pkgs; [
      # Fallback Fonts
      nerd-fonts.jetbrains-mono

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
    ];
    fontDir.enable = true;

    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [
          "Noto Color Emoji"
          "Noto Emoji"
        ];
        monospace = [ "JetBrainsMono" ];
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
      };
    };
  };
}

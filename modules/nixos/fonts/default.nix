{ pkgs, ... }:
{
  console.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
  console.font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Medium.ttf";

  fonts = {
    packages = with pkgs; [
      # Fallback Fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only

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

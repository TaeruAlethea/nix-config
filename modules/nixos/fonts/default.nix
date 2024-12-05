{ pkgs, ... }:
{
    fonts = {
        packages = with pkgs; [
            # Fallback Fonts
            (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-color-emoji
            noto-fonts-monochrome-emoji
        ];
        fontDir.enable = true;
    };
}
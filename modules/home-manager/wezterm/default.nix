{ ... }: {
	flake.homeModules.wezterm = { ... }:
  {
    programs.wezterm = {
      enable = true;
      enableBashIntegration = true;
      extraConfig =
        "return{
          font = wezterm.font 'JetBrains Mono',
          font_size = 12,
          hide_mouse_cursor_when_typing = false,
          initial_cols = 120,
          initial_rows = 28,
          window_background_opacity = 0.7
        }";
    };
  };
}

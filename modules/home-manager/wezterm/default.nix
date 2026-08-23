{ ... }:
{
  flake.modules.homeManager.wezterm =
    { ... }:
    {

      home.sessionVariables.TERMINAL = "wezterm";

      programs.wezterm = {
        enable = true;
        enableBashIntegration = true;
        extraConfig = "return{
          font = wezterm.font 'JetBrains Mono',
          font_size = 12,
          hide_mouse_cursor_when_typing = false,
          initial_cols = 120,
          initial_rows = 28,
          window_background_opacity = 0.7,
          keys = {
            {
              key = 'q',
              mods = 'CTRL|ALT',
              action = wezterm.action.CloseCurrentTab { confirm=true }
            },
            {
              key = 'w',
              mods = 'CTRL|ALT',
              action = wezterm.action.CloseCurrentPane { confirm = false }
            },
            {
              key = 'v',
              mods = 'CTRL|ALT',
              action = wezterm.action.SplitHorizontal { domain=\"CurrentPaneDomain\" }
            },
            {
              key = 's',
              mods = 'CTRL|ALT',
              action = wezterm.action.SplitVertical { domain=\"CurrentPaneDomain\" }
            }
          }
        }";
      };
    };
}

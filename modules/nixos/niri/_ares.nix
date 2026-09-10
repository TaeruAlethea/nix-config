{
  spawn-at-startup = [
    {
      argv = [
        "bash"
        "-c"
        "wl-paste --watch cliphist store &"
      ];
    }
    { argv = [ "/usr/lib/mate-polkit/polkit-mate-authentication-agent-1" ]; }
  ];

  cursor = {
    size = 36;
  };

  input = {
    keyboard.numlock = true;

    mouse = {
      enable = true;
      accel-speed = -0.2;
      accel-profile = "flat";
    };
    touchpad = {
      enable = true;
      tap = true;
      natural-scroll = true;
      scroll-factor = 0.75;
      dwt = true;
    };
  };

  outputs = {
    "eDP-1" = {
      # Top Display
      enable = true;
      focus-at-startup = true;
      mode = {
        width = 2636;
        height = 1824;
        refresh = 60.000;
      };
      scale = 1.3;
      transform.rotation = 0;
      position.x = 0;
      position.y = 0;
    };
  };

  binds = {
    "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];

    "Mod+T" = {
      hotkey-overlay.title = "Open a Terminal: wezterm";
      action.spawn = [ "wezterm" ];
    };

    "Mod+E" = {
      # repeat = false;
      # hotkey-overlay.title = "Toggle Lower Display";
      action.spawn = [
        "sh"
        "-c"
        ''niri msg -j outputs | jq '."eDP-2" | if .current_mode == null then "on" else "off" end' | xargs niri msg output eDP-2''
      ];
    };
  };
}

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
    workspace-auto-back-and-forth = true;
    keyboard.numlock = true;

    mouse = {
      enable = true;
      accel-speed = -0.2;
      accel-profile = "flat";
    };
  };

  outputs = {
    "DP-3" = {
      enable = true;
      mode = {
        width = 3440;
        height = 1440;
        refresh = 120.000;
      }; # "3440x1440@120.000";
      variable-refresh-rate = true;
      scale = 1;
      transform.rotation = 0;
      position.x = 1080;
      position.y = 0;
    };
    "DP-2" = {
      enable = true;
      mode = {
        width = 1920;
        height = 1080;
        refresh = 119.982;
      }; # "1920x1080@119.982";
      variable-refresh-rate = "on-demand";
      scale = 1;
      transform.rotation = 90;
      position.x = 0;
      position.y = -480;
    };
    # "HDMI-A-1" = {
    #   enable = true;
    #   mode = {
    #     width = 1920;
    #     height = 1080;
    #     refresh = 60.000;
    #   }; # "1920x1080@60.000";
    #   # variable-refresh-rate = "on-demand";
    #   scale = 1;
    #   transform.rotation = 90;
    #   position.x = 0;
    #   position.y = -480;
    # };
  };

  binds = {
    "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];

    "Mod+T" = {
      hotkey-overlay.title = "Open a Terminal: wezterm";
      action.spawn = [ "wezterm" ];
    };
    "XF86AudioPlay" = {
      allow-when-locked = true;
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "mpris"
        "playPause"
      ];
    };
  };
}

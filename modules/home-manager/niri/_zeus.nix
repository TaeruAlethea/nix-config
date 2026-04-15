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
    # { argv = ["wezterm cli spawn --new-window --workspace scratchpad --"]; }
    # { argv = ["dms" "run"]; }
  ];

  # config-notification.disable-failed = true;

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
  };

  layout = {
    gaps = 16;
    always-center-single-column = false;
    preset-column-widths = [
      { proportion = 1. / 3.; }
      { proportion = 1. / 2.; }
      { proportion = 2. / 3.; }
    ];
    default-column-width = {
      proportion = 1. / 2.;
    };

    focus-ring = {
      enable = true;
      width = 4;
      active = {
        color = "#7fc8ff";
      };
      inactive = {
        color = "#505050";
      };
    };

    border = {
      enable = true;
      width = 4;
      active = {
        color = "#ffc87f";
      };
      inactive = {
        color = "#505050";
      };
      urgent = {
        color = "#9b0000";
      };
    };

    # shadow = {
    # 	enable = true;
    # 	softness = 30;
    # 	spread = 5;
    # 	offset.x = 0;
    # 	offset.y = 5;
    # 	color = "#000007";
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

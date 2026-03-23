{
    spawn-at-startup =[
        { argv = ["bash" "-c" "wl-paste --watch cliphist store &"]; }
        { argv = ["/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"]; }
        # { argv = ["dms" "run"]; }
    ];

    # config-notification.disable-failed = true;

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
                width = 2880;
                height = 1800;
                refresh = 120.000;
            };
            scale = 1.3;
            transform.rotation = 0;
            position.x = 0;
            position.y = 0;
        };
        "eDP-2" = {
            # Bottom Display
            enable = false;
            mode = {
                width = 2880;
                height = 1800;
                refresh = 120.000;
            };
            scale = 1.3;
            transform.rotation = 0;
            position.x = 0;
            position.y = 1385;
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
        default-column-width = { proportion = 1. / 2.; };

        focus-ring = {
            enable = true;
            width = 4;
            active = { color = "#7fc8ff"; };
            inactive = { color = "#505050"; };
        };

        border = {
            enable = true;
            width = 4;
            active = { color = "#ffc87f"; };
            inactive = { color = "#505050"; };
            urgent = { color = "#9b0000"; };
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

    #window-rules.* = {
    #	geometry-corner-radius = 12;
    #	clip-to-geometry = true;
    #};

    binds = {
        "Mod+Shift+Slash".action.show-hotkey-overlay = [];

        "Mod+T" = {
            hotkey-overlay.title = "Open a Terminal: wezterm";
            action.spawn = ["wezterm"];
        };

        "Mod+E" = {
            # repeat = false;
            # hotkey-overlay.title = "Toggle Lower Display";
            action.spawn = ["sh" "-c" ''niri msg -j outputs | jq '."eDP-2" | if .current_mode == null then "on" else "off" end' | xargs niri msg output eDP-2''];
        };

        # "XF86AudioRaiseVolume" = {
        # 	allow-when-locked = true;
        # 	action.spawn = ["dms" "ipc" "call" "audio" "increment" "3"];
        # };
        # "XF86AudioLowerVolume" = {
        # 	allow-when-locked = true;
        # 	action.spawn = ["dms" "ipc" "call" "audio" "decrement" "3"];
        # };
        # "XF86AudioMute" = {
        # 	allow-when-locked = true;
        # 	action.spawn = ["dms" "ipc" "call" "audio" "mute"];
        # };
        # "XF86AudioMicMute" = {
        # 	allow-when-locked = true;
        # 	action.spawn = ["dms" "ipc" "call" "audio" "micmute"];
        # };
        # "XF86MonBrightnessUp" = {
        # 	allow-when-locked = true;
        # 	action.spawn = ["dms" "ipc" "call" "brightness" "increment" "5" ""];
        # };
        # "XF86MonBrightnessDown" = {
        # 	allow-when-locked = true;
        # 	action.spawn = ["dms" "ipc" "call" "brightness" "decrement" "5" ""];
        # };
    };
}

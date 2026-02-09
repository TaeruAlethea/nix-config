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
    };
    
    outputs = {
        "eDP-1" = {
            # Top Display
            enable = true;
            # mode = "3440x1440@120";
            scale = 1.5;
            transform.rotation = 0;
            position.x = 0;
            position.y = 1800;
        };
        "eDP-2" = {
            # Bottom Display
            enable = false;
            # mode = "1920x1080";
            scale = 1.5;
            transform.rotation = 0;
            position.x = 0;
            position.y = 0;
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

        "Mod+Tab" = { repeat = false; action.toggle-overview = []; };
        "Mod+Q" = { repeat = false; action.close-window = []; };

        "Mod+Left"  = { action.focus-column-left = []; };
        "Mod+Down"  = { action.focus-window-down = []; };
        "Mod+Up"    = { action.focus-window-up = []; };
        "Mod+Right" = { action.focus-column-right = []; };
        "Mod+H"     = { action.focus-column-left = []; };
        "Mod+J"     = { action.focus-window-down = []; };
        "Mod+K"     = { action.focus-window-up = []; };
        "Mod+L"     = { action.focus-column-right = []; };

        "Mod+Ctrl+Left"  = { action.move-column-left = []; };
        "Mod+Ctrl+Down"  = { action.move-window-down = []; };
        "Mod+Ctrl+Up"    = { action.move-window-up = []; };
        "Mod+Ctrl+Right" = { action.move-column-right = []; };
        "Mod+Ctrl+H"     = { action.move-column-left = []; };
        "Mod+Ctrl+J"     = { action.move-window-down = []; };
        "Mod+Ctrl+K"     = { action.move-window-up = []; };
        "Mod+Ctrl+L"     = { action.move-column-right = []; };

        "Mod+Shift+Left"  = { action.focus-monitor-left = []; };
        "Mod+Shift+Down"  = { action.focus-monitor-down = []; };
        "Mod+Shift+Up"    = { action.focus-monitor-up = []; };
        "Mod+Shift+Right" = { action.focus-monitor-right = []; };
        "Mod+Shift+H"     = { action.focus-monitor-left = []; };
        "Mod+Shift+J"     = { action.focus-monitor-down = []; };
        "Mod+Shift+K"     = { action.focus-monitor-up = []; };
        "Mod+Shift+L"     = { action.focus-monitor-right = []; };

        "Mod+Shift+Ctrl+Left"  = { action.move-column-to-monitor-left = []; };
        "Mod+Shift+Ctrl+Down"  = { action.move-column-to-monitor-down = []; };
        "Mod+Shift+Ctrl+Up"    = { action.move-column-to-monitor-up = []; };
        "Mod+Shift+Ctrl+Right" = { action.move-column-to-monitor-right = []; };
        "Mod+Shift+Ctrl+H"     = { action.move-column-to-monitor-left = []; };
        "Mod+Shift+Ctrl+J"     = { action.move-column-to-monitor-down = []; };
        "Mod+Shift+Ctrl+K"     = { action.move-column-to-monitor-up = []; };
        "Mod+Shift+Ctrl+L"     = { action.move-column-to-monitor-right = []; };

        # "Mod+WheelScrollDown"      = { cooldown-ms = 150; action.focus-workspace-down = true; };
        # "Mod+WheelScrollUp"        = { cooldown-ms = 150; action.focus-workspace-up = true; };
        # "Mod+Ctrl+WheelScrollDown" = { cooldown-ms = 150; action.move-column-to-workspace-down = true; };
        # "Mod+Ctrl+WheelScrollUp"   = { cooldown-ms = 150; move-column-to-workspace-up = true; };
        
        "Mod+WheelScrollRight"      = { action.focus-column-right = []; };
        "Mod+WheelScrollLeft"       = { action.focus-column-left = []; };
        "Mod+Ctrl+WheelScrollRight" = { action.move-column-right = []; };
        "Mod+Ctrl+WheelScrollLeft"  = { action.move-column-left = []; };

        # "Mod+Shift+WheelScrollDown"      = { action.focus-column-right = true; };
        # "Mod+Shift+WheelScrollUp"        = { action.focus-column-left = true; };
        "Mod+Ctrl+Shift+WheelScrollDown" = { action.move-column-right = []; };
        "Mod+Ctrl+Shift+WheelScrollUp"   = { action.move-column-left = []; };

        "Mod+1" = { action.focus-workspace = 1; };
        "Mod+2" = { action.focus-workspace = 2; };
        "Mod+3" = { action.focus-workspace = 3; };
        "Mod+4" = { action.focus-workspace = 4; };
        "Mod+5" = { action.focus-workspace = 5; };
        "Mod+6" = { action.focus-workspace = 6; };
        "Mod+7" = { action.focus-workspace = 7; };
        "Mod+8" = { action.focus-workspace = 8; };
        "Mod+9" = { action.focus-workspace = 9; };

        "Mod+Ctrl+1" = { action.move-column-to-workspace = 1; };
        "Mod+Ctrl+2" = { action.move-column-to-workspace = 2; };
        "Mod+Ctrl+3" = { action.move-column-to-workspace = 3; };
        "Mod+Ctrl+4" = { action.move-column-to-workspace = 4; };
        "Mod+Ctrl+5" = { action.move-column-to-workspace = 5; };
        "Mod+Ctrl+6" = { action.move-column-to-workspace = 6; };
        "Mod+Ctrl+7" = { action.move-column-to-workspace = 7; };
        "Mod+Ctrl+8" = { action.move-column-to-workspace = 8; };
        "Mod+Ctrl+9" = { action.move-column-to-workspace = 9; };

        "Mod+BracketLeft"  = { action.consume-or-expel-window-left = []; };
        "Mod+BracketRight" = { action.consume-or-expel-window-right = []; };

        "Mod+R"            = { action.switch-preset-column-width = []; };
        "Mod+Shift+R"      = { action.switch-preset-window-height = []; };
        "Mod+Ctrl+R"       = { action.reset-window-height = []; };
        "Mod+F"            = { action.maximize-column = []; };
        "Mod+Shift+F"      = { action.fullscreen-window = []; };
        "Mod+Ctrl+F"       = { action.expand-column-to-available-width = []; };
        "Mod+Shift+C"      = { action.center-column = []; };
        "Mod+Ctrl+C"       = { action.center-visible-columns = []; };

        "Mod+Minus"       = { action.set-column-width = "-10%"; };
        "Mod+Equal"       = { action.set-column-width = "+10%"; };
        "Mod+Shift+Minus" = { action.set-window-height = "-10%"; };
        "Mod+Shift+Equal" = { action.set-window-height = "+10%"; };
        "Mod+Shift+V"     = { action.toggle-window-floating = []; };

        "Mod+W"       = { action.toggle-column-tabbed-display = []; };

        "Mod+Shift+S" = { action.screenshot = { show-pointer = false; }; };
        "Print"       = { action.screenshot = { show-pointer = false; }; };
        "Ctrl+Print"  = { action.screenshot-screen = { show-pointer = false; }; };
        "Alt+Print"   = { action.screenshot-window = []; };

        "Mod+Shift+E"     = { action.quit = []; };
        "Ctrl+Alt+Delete" = { action.quit = []; };

        "Mod+Shift+P" = { action.power-off-monitors = []; };

    };
}

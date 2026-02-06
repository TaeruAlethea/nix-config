{ inputs, pkgs, ... } :
{
	imports = [
		inputs.niri.homeModules.niri
	];

	programs.niri.settings = {
		spawn-at-startup =[
			{ argv = ["bash" "-c" "wl-paste --watch cliphist store &"]; }
			{ argv = ["/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"]; }
			{ argv = ["dms" "run"]; }
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
				"DP-3" = {
					enable = true;
					# mode = "3440x1440@120";
					variable-refresh-rate = true;
					scale = 1;
					transform.rotation = 0;
					position.x = 1080;
					position.y = 0;
				};
				"HDMI-A-1" = {
					enable = true;
					# mode = "1920x1080";
					scale = 1;
					transform.rotation = 90;
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
				# 	color = { "#0007" };
				# };
			};

			#window-rules.* = {
			#	geometry-corner-radius = 12;
			#	clip-to-geometry = true;
			#};

			binds = {
				"Mod+Shift+Slash".action.show-hotkey-overlay = true;

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

				"Mod+Tab" = { repeat = false; action.toggle-overview = true; };
				"Mod+Q" = { repeat = false; action.close-window = true; };

				"Mod+Left"  = { action.focus-column-left = true; };
				"Mod+Down"  = { action.focus-window-down = true; };
				"Mod+Up"    = { action.focus-window-up = true; };
				"Mod+Right" = { action.focus-column-right = true; };
				"Mod+H"     = { action.focus-column-left = true; };
				"Mod+J"     = { action.focus-window-down = true; };
				"Mod+K"     = { action.focus-window-up = true; };
				"Mod+L"     = { action.focus-column-right = true; };

				"Mod+Ctrl+Left"  = { action.move-column-left = true; };
				"Mod+Ctrl+Down"  = { action.move-window-down = true; };
				"Mod+Ctrl+Up"    = { action.move-window-up = true; };
				"Mod+Ctrl+Right" = { action.move-column-right = true; };
				"Mod+Ctrl+H"     = { action.move-column-left = true; };
				"Mod+Ctrl+J"     = { action.move-window-down = true; };
				"Mod+Ctrl+K"     = { action.move-window-up = true; };
				"Mod+Ctrl+L"     = { action.move-column-right = true; };

				"Mod+Shift+Left"  = { action.focus-monitor-left = true; };
				"Mod+Shift+Down"  = { action.focus-monitor-down = true; };
				"Mod+Shift+Up"    = { action.focus-monitor-up = true; };
				"Mod+Shift+Right" = { action.focus-monitor-right = true; };
				"Mod+Shift+H"     = { action.focus-monitor-left = true; };
				"Mod+Shift+J"     = { action.focus-monitor-down = true; };
				"Mod+Shift+K"     = { action.focus-monitor-up = true; };
				"Mod+Shift+L"     = { action.focus-monitor-right = true; };

				"Mod+Shift+Ctrl+Left"  = { action.move-column-to-monitor-left = true; };
				"Mod+Shift+Ctrl+Down"  = { action.move-column-to-monitor-down = true; };
				"Mod+Shift+Ctrl+Up"    = { action.move-column-to-monitor-up = true; };
				"Mod+Shift+Ctrl+Right" = { action.move-column-to-monitor-right = true; };
				"Mod+Shift+Ctrl+H"     = { action.move-column-to-monitor-left = true; };
				"Mod+Shift+Ctrl+J"     = { action.move-column-to-monitor-down = true; };
				"Mod+Shift+Ctrl+K"     = { action.move-column-to-monitor-up = true; };
				"Mod+Shift+Ctrl+L"     = { action.move-column-to-monitor-right = true; };

				# "Mod+WheelScrollDown"      = { cooldown-ms = 150; action.focus-workspace-down = true; };
				# "Mod+WheelScrollUp"        = { cooldown-ms = 150; action.focus-workspace-up = true; };
				# "Mod+Ctrl+WheelScrollDown" = { cooldown-ms = 150; action.move-column-to-workspace-down = true; };
				# "Mod+Ctrl+WheelScrollUp"   = { cooldown-ms = 150; move-column-to-workspace-up = true; };
				
				"Mod+WheelScrollRight"      = { action.focus-column-right = true; };
				"Mod+WheelScrollLeft"       = { action.focus-column-left = true; };
				"Mod+Ctrl+WheelScrollRight" = { action.move-column-right = true; };
				"Mod+Ctrl+WheelScrollLeft"  = { action.move-column-left = true; };

				# "Mod+Shift+WheelScrollDown"      = { action.focus-column-right = true; };
				# "Mod+Shift+WheelScrollUp"        = { action.focus-column-left = true; };
				"Mod+Ctrl+Shift+WheelScrollDown" = { action.move-column-right = true; };
				"Mod+Ctrl+Shift+WheelScrollUp"   = { action.move-column-left = true; };

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

				"Mod+BracketLeft"  = { action.consume-or-expel-window-left = true; };
				"Mod+BracketRight" = { action.consume-or-expel-window-right = true; };

				"Mod+R"            = { action.switch-preset-column-width = true; };
				"Mod+Shift+R"      = { action.switch-preset-window-height = true; };
				"Mod+Ctrl+R"       = { action.reset-window-height = true; };
				"Mod+F"            = { action.maximize-column = true; };
				"Mod+Shift+F"      = { action.fullscreen-window = true; };
				"Mod+Ctrl+F"       = { action.expand-column-to-available-width = true; };
				"Mod+Shift+C"      = { action.center-column = true; };
				"Mod+Ctrl+C"       = { action.center-visible-columns = true; };

				"Mod+Minus"       = { action.set-column-width = "-10%"; };
				"Mod+Equal"       = { action.set-column-width = "+10%"; };
				"Mod+Shift+Minus" = { action.set-window-height = "-10%"; };
				"Mod+Shift+Equal" = { action.set-window-height = "+10%"; };
				"Mod+Shift+V"     = { action.toggle-window-floating = true; };

				"Mod+W"       = { action.toggle-column-tabbed-display = true; };

				"Mod+Shift+S" = { action.screenshot = { show-pointer = false; }; };
				"Print"       = { action.screenshot = { show-pointer = false; }; };
				"Ctrl+Print"  = { action.screenshot-screen = { show-pointer = false; }; };
				"Alt+Print"   = { action.screenshot-window = { show-pointer = false; }; };

				"Mod+Shift+E"     = { action.quit = true; };
				"Ctrl+Alt+Delete" = { action.quit = true; };

				"Mod+Shift+P" = { action.power-off-monitors = true; };

				# "Mod+Space" = {
				# 	hotkey-overlay-title = "Application Launcher";
				# 	action.spawn = ["dms" "ipc" "call" "spotlight" "toggle"];
				# };
				# "Mod+V" = {
				# 	hotkey-overlay-title="Clipboard Manager";
				# 	action.spawn = ["dms" "ipc" "call" "clipboard" "toggle"];
				# };
				# "Mod+M" = {
				# 	hotkey-overlay-title = "Task Manager";
				# 	action.spawn = ["dms" "ipc" "call" "processlist" "toggle"];
				# };
				# "Mod+N" = {
				# 	hotkey-overlay-title = "Notification Center";
				# 	action.spawn = ["dms" "ipc" "call" "notifications" "toggle"];
				# };
				# "Mod+Comma" = {
				# 	hotkey-overlay-title = "Settings";
				# 	action.spawn = ["dms" "ipc" "call" "settings" "toggle"];
				# };
				# "Mod+P" = {
				# 	hotkey-overlay-title = "Notepad";
				# 	action.spawn = ["dms" "ipc" "call" "notepad" "toggle"];
				# };
				# "Super+Alt+L" = {
				# 	hotkey-overlay-title = "Lock Screen";
				# 	action.spawn = ["dms" "ipc" "call" "lock" "lock"];
				# };
				# "Mod+X" = {
				# 	hotkey-overlay-title = "Power Menu";
				# 	action.spawn = ["dms" "ipc" "call" "powermenu" "toggle"];
				# };
				# "Mod+C" = {
				# 	hotkey-overlay-title = "Control Center";
				# 	action.spawn = ["dms" "ipc" "call" "control-center" "toggle"];
				# };

				# Night mode toggle
				# "Mod+Shift+N" = {
				# 	allow-when-locked = true;
				# 	action.spawn = ["dms" "ipc" "call" "night" "toggle"];
				# };
			};
		};

	# xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

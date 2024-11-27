{ pkgs, ... }:
{
	programs.waybar = {
		enable = true;
		style = builtins.readFile ./waybar.css;
		settings = [{
			layer = "top";
			position = "top";
			mod = "dock";
			exclusive = true;
			passthrough = false;
			gtk-layer-shell = true;
			height = 0;
			modules-left = [
				"hyprland/workspaces"
				"custom/divider"
				"cpu"
				"custom/divider"
				"memory"
			];
			modules-center = [ "hyperland/window" ];
			modules-right = [
				"tray"
				"network"
				"custom/divider"
				"backlight"
				"custom/divider"
				"pulseaudio"
				"custom/divider"
				"battery"
				"custom/divider"
				"clock"
			];
			"hyprland/window" = { format = "{}" };
			"wlr/workspaces" = {
				on-scroll-up = "hyprctl dispatch workspace e+1"
				on-scroll-down = "hyprctl dispatch workspace e-1"
				all-outputs = true;
				on-click = "activate";
			};
			battery = { format = "{}%"; };
			cpu = {
				interval = 10;
				format = "{}%";
				max-length = 10;
				on-click = "";
			};
		}];
	};
}

{ inputs, pkgs, ... }:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  plugins = inputs.hyprland-plugins.packages.${pkgs.system};

  launcher = pkgs.writeShellScriptBin "hypr" ''
    #!/${pkgs.bash}/bin/bash

    export WLR_NO_HARDWARE_CURSORS=1
    export _JAVA_AWT_WM_NONREPARENTING=1

    exec ${hyprland}/bin/Hyprland
  '';
in
{
  home.packages = [ launcher ];
  programs = {
    bemenu.enable = true;
    kitty.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    # systemd.enable = true;
    xwayland.enable = true;
    # plugins = with plugins; [ hyprbars borderspp ];

    settings = {
      exec-once = [
        "hyprctl setcursor Qogir 24"
      ];

      monitor = [
        "eDP-1,preferred,auto,1.333333"
      ];

      general = {
        layout = "dwindle";
        resize_on_border = true;
      };

      misc = {
        layers_hog_keyboard_focus = false;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      input = {
        follow_mouse = 2;
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      #binds = {
      #  allow_workspace_cycles = true;
      #};

      bind = [
        "SUPER, T, exec, kitty"
        "SUPER, A, exec, sysmenu"
        "SUPER, L, exec, hyprlock-blue"
      ];

      #bindm = [
      #  "SUPER, mouse:273, resizewindow"
      #  "SUPER, mouse:272, movewindow"
      #];

      dwindle = { 
        pseudotile = "yes"; 
        preserve_split = "yes";
        # no_gaps_when_only = "yes";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };

      decoration = {
        dim_inactive = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      plugin = {
        hyprbars = {
          bar_color = "rgb(2a2a2a)";
          bar_height = 28;
          col_text = "rgba(ffffffdd)";
          bar_text_size = 11;
          bar_text_font = "Ubuntu Nerd Font";

          buttons = {
            button_size = 0;
            "col.maximize" = "rgba(ffffff11)";
            "col.close" = "rgba(ff111133)";
          };
        };
      };
    };
  };

  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = { 
      disable_loading_bar = true;
    }
    background = {
      monitor=eDP-1
      blur_passes=1
      noise=0.011700
      path=/tmp/screenshot1.png
    }
    image {
      monitor=eDP-1
      halign=center
      path=/home/astraeaf/Pictures/profile.png
      position=0, 50
      valign=center
    }
    input-field {
      monitor=eDP-1
      size=200,50
      check_color=rgb(30, 107, 204)
      dots_center=true
      dots_size=0.200000
      fade_on_empty=false
      font_color=rgb(111, 45, 104)
      halign=center
      inner_color=rgba(0, 0, 0, 0.2)
      outer_color=rgba(0, 0, 0, 0)
      outline_thickness=2
      placeholder_text=<i><span foreground="##cdd6f4">Input Password...</span></i>
      position=0, -100
      rounding=-1
      valign=center
    }
    label {
      monitor=eDP-1
      color=rgba(242, 243, 244, 0.75)
      font_family=JetBrains Mono
      font_size=95
      halign=center
      position=0, 300
      time=$TIME
      valign=center
    }
    label {
      monitor=eDP-1
      color=rgba(242, 243, 244, 0.75)
      font_family=JetBrains Mono
      font_size=22
      halign=center
      position=0,200
      text=cmd[update:1000] echo $(date +"%A, %B %d")
      valign=center
    }
  };
}

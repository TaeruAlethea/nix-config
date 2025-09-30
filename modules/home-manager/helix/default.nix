{ pkgs, ... }:
{
  home.sessionVariables.EDITOR = "hx";

  home.packages = with pkgs; [
    rustfmt # Rust Formatter

    nil # Nix Language Server
    nixfmt-tree # Nix Formatter
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "foxo_dark";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        cursorcolumn = true;
        color-modes = true;
        popup-border = "all";
        end-of-line-diagnostics = "hint";

        cursor-shape.insert = "bar";

        whitespace.render = {
          space = "all";
          tab = "all";
          nbsp = "none";
          nnbsp = "none";
          newline = "none";
        };
        soft-wrap.enable = true;

        inline-diagnostics = {
          cursor-line = "warning";
          other-lines = "error";
        };
      };
      keys = {
        normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
          C-g = [
            ":write-all"
            ":new"
            ":insert-output lazygit"
            ":buffer-close!"
            ":redraw"
            ":reload-all"
          ];
          C-s = ":w";
        };

        insert = {
          C-c = "normal_mode";
        };

        select = {
          C-c = "normal_mode";
        };
      };

    };

    languages = {
      language = [
        {
          name = "rust";
          formatter = {
            command = "rustfmt";
          };
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {
            command = "nixfmt";
          };
        }
      ];
    };

    themes = {
      foxo_dark = {
        "inherits" = "ayu_evolve";
      };
      foxo_light = {
        "inherits" = "ayu_light";
      };
    };
  };
}

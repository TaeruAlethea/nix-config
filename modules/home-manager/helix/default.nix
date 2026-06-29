{ ... }:
{
  flake.modules.homeManager.helix =
    { pkgs, lib, ... }:
    {
      home.sessionVariables.EDITOR = "hx";

      home.packages = with pkgs; [
        # C-Sharp
        omnisharp-roslyn # Lanuage Server
        netcoredbg # debug adapter

        # Json
        vscode-json-languageserver

        # nix
        nixd # Nix Language Server
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

            indent-guides.render = true;

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
              j = {
                j = "normal_mode";
              };
            };

            select = {
              C-c = "normal_mode";
              j = {
                j = "normal_mode";
              };

            };
          };

        };

        languages = {
          language = [
            {
              name = "c-sharp";
              formatter.command = "${lib.getExe pkgs.csharpier}";
              auto-format = true;
            }
            {
              name = "json";
              formatter.command = "${lib.getExe pkgs.jsonfmt}";
              auto-format = true;
            }
            {
              name = "nix";
              formatter = {
                command = "treefmt";
              };
              indent = {
                tab-width = 2;
                unit = "t";
              };
            }
            {
              name = "rust";
              formatter = {
                command = "${lib.getExe pkgs.rustfmt}";
              };
              auto-format = true;
            }
            {
              name = "yaml";
              formatter.command = "${lib.getExe pkgs.yamlfmt}";
            }
          ];
        };

        themes = {
          foxo_dark = {
            "inherits" = "ayu_evolve";
            "ui.background" = "{}";
          };
          foxo_light = {
            "inherits" = "ayu_light";
            "ui.background" = "{}";
          };
        };
      };
    };
}

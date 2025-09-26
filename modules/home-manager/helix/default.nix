{ pkgs, ... }:
{
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

                softwrap.enable = true;

                inline-diagnostics = {
                    cursor-line = "warning";
                    other-lines = "error";
                };

                keys = {
                    normal = {
                        esc = ["collapse_selection", "keep_primary_selection"];
                        ctrl.g = [
                            ":write-all",
                            ":new",
                            ":insert-output lazygit",
                            ":buffer-close!",
                            ":redraw",
                            ":reload-all"
                        ];
                        ctrl.s = ":w";
                    };

                    insert = {
                        ctrl.c = "normal_mode";
                    };

                    select = {
                        ctrl.c = "normal_mode";
                    };
                };
            };

        };


        languages = [{
            name = "rust";
            formatter = "{ command = \"rustfmt\" }";
            auto-format = true;
        }];


        themes = [
            "foxo_dark" = { "inherits" = "ayu_evolve"; };
            "foxo_light" = { "inherits" = "ayu_light"; };
        ];
    };
}

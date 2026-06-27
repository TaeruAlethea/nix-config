{ inputs, moduleWithSystem, ... }:
{
  flake-file.inputs.zen-browser.url = "github:youwen5/zen-browser-flake";
  flake-file.inputs.firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

  flake.modules.homeManager.zen-browser = moduleWithSystem (
    { pkgs, system, ... }:
    {
      home.sessionVariables.BROWSER = "zen";

      programs.firefox = {
        enable = true;
        package = inputs.zen-browser.packages.${system}.default;

        profiles."default" = {
          isDefault = true;
          settings = {
            "browser.tabs.allow_transparent_browser" = true;
            # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            # "sidebar.verticalTabs" = true;
            # "extensions.autoDisableScopes" = 0;
            "intl.regional_prefs.use_os_locales" = true;
          };

          # userChrome = ./userChrome.css;

          extensions = {
            packages = with inputs.firefox-addons.packages.${system}; [
              adnauseam
              bitwarden
              privacy-badger
              shinigami-eyes
              sponsorblock
              # tampermonkey
            ];
          };
        };
      };
    }
  );
}

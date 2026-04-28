{ inputs, moduleWithSystem, ... }:
{
  flake-file.inputs.firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

  flake.modules.homeManager.firefox = moduleWithSystem (
    { pkgs, system, ... }:
    {
      home.sessionVariables.BROWSER = "firefox";

      # home.packages = with pkgs; [
      # 	lynx
      # ];

      programs.firefox = {
        enable = true;
        package = pkgs.firefox;

        profiles."default" = {
          isDefault = true;
          settings = {
            "browser.tabs.allow_transparent_browser" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "sidebar.verticalTabs" = true;
            "extensions.autoDisableScopes" = 0;
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

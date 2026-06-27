{ inputs, moduleWithSystem, ... }:
{
  flake-file.inputs.zen-browser.url = "github:youwen5/zen-browser-flake";
  flake-file.inputs.firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

  flake.modules.homeManager.zen-browser = moduleWithSystem (
    { pkgs, system, ... }:
    let
      extension = shortId: guid: {
        name = guid;
        value = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
          installation_mode = "normal_installed";
        };
      };

      prefs = {
        "extensions.autoDisableScopes" = 0;
        "browser.tabs.allow_transparent_browser" = true;
        "widget.transparent-windows" = true;
        "widget.windows.mica" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "intl.regional_prefs.use_os_locales" = true;

        "zen.theme.gradient.show-custom-colors" = true;
        "zen.widget.linux.transparency" = true;
        "zen.view.grey-out-inactive-windows" = false;
      };

      extensions = [
        # To add additional extensions, find it on addons.mozilla.org, find
        # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
        # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid
        (extension "ublock-origin" "uBlock0@raymondhill.net")
        (extension "adnauseam" "adnauseam@rednoise.org")
        (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
        (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
        (extension "shinigami-eyes" "shinigamieyes@shinigamieyes")
        (extension "sponsorblock" "sponsorBlocker@ajay.app")
        (extension "tampermonkey" "firefox@tampermonkey.net")

        (extension "zen-internet" "{91aa3897-2634-4a8a-9092-279db23a7689}")
      ];
    in
    {
      home.sessionVariables.BROWSER = "zen";

      home.packages = with pkgs; [
        (pkgs.wrapFirefox inputs.zen-browser.packages.${system}.zen-browser-unwrapped {
          extraPrefs = lib.concatLines (
            lib.mapAttrsToList (
              name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
            ) prefs
          );

          extraPolicies = {
            DisableTelemetry = true;
            ExtensionSettings = builtins.listToAttrs extensions;

            SearchEngines = {
              Default = "ddg";
              Add = [
                {
                  Name = "nixpkgs packages";
                  URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
                  IconURL = "https://wiki.nixos.org/favicon.ico";
                  Alias = "@np";
                }
                {
                  Name = "NixOS options";
                  URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
                  IconURL = "https://wiki.nixos.org/favicon.ico";
                  Alias = "@no";
                }
                {
                  Name = "NixOS Wiki";
                  URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
                  IconURL = "https://wiki.nixos.org/favicon.ico";
                  Alias = "@nw";
                }
                {
                  Name = "noogle";
                  URLTemplate = "https://noogle.dev/q?term={searchTerms}";
                  IconURL = "https://noogle.dev/favicon.ico";
                  Alias = "@ng";
                }
              ];
            };
          };
        })
      ];
    }
  );
}

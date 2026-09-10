{
  currentThemeName = "dynamic";
  currentThemeCategory = "dynamic";
  cornerRadius = 12;
  calendarBackend = "dankcal";
  clockFormat = "24h";
  barElevationEnabled = false;
  blurredWallpaperLayer = true;
  blurWallpaperOnOverview = true;
  appIdSubstitutions = [
    {
      pattern = "Spotify";
      replacement = "spotify";
      type = "exact";
    }
    {
      pattern = "beepertexts";
      replacement = "beeper";
      type = "exact";
    }
    {
      pattern = "home assistant desktop";
      replacement = "homeassistant-desktop";
      type = "exact";
    }
    {
      pattern = "com.transmissionbt.transmission";
      replacement = "transmission-gtk";
      type = "contains";
    }
    {
      pattern = "^steam_app_(d+)$";
      replacement = "steam_icon_$1";
      type = "regex";
    }
  ];
  cursorSettings = {
    dwl = {
      cursorHideTimeout = 0;
    };
    hyprland = {
      hideOnKeyPress = false;
      hideOnTouch = false;
      inactiveTimeout = 0;
    };
    niri = {
      hideAfterInactiveMs = 0;
      hideWhenTyping = false;
    };
    size = 24;
    theme = "System Default";
  };
  matugenTemplateNeovim = true;
  osdPosition = 4;
  osdMediaPlaybackEnabled = true;
  barConfigs = [
    {
      autoHide = false;
      autoHideDelay = 250;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 1;
      bottomGap = 0;
      centerWidgets = [
        {
          enabled = true;
          id = "music";
          mediaSize = 3;
        }
        {
          clockCompactMode = false;
          enabled = true;
          id = "clock";
        }
        "weather"
        {
          enabled = true;
          id = "dankPomodoroTimer";
        }
        {
          enabled = true;
          id = "dankKDEConnect";
        }
      ];
      enabled = true;
      fontScale = 1;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      gothCornersEnabled = false;
      id = "default";
      innerPadding = 4;
      leftWidgets = [
        "launcherButton"
        "workspaceSwitcher"
        "focusedWindow"
      ];
      name = "Main Bar";
      noBackground = false;
      openOnOverview = false;
      popupGapsAuto = true;
      popupGapsManual = 4;
      position = 0;
      rightWidgets = [
        {
          enabled = true;
          id = "networkIndicator";
        }
        {
          enabled = true;
          id = "dankRazer";
        }
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        "systemTray"
        "notificationButton"
        "clipboard"
        "cpuUsage"
        "memUsage"
        "battery"
        "controlCenterButton"
      ];
      screenPreferences = [
        {
          name = "DP-3";
          model = "CU34G4";
        }
      ];
      showOnLastDisplay = false;
      spacing = 4;
      squareCorners = false;
      transparency = 1;
      visible = true;
      widgetTransparency = 0.5;
      islandTransparency = 0.5;
      islandPalette = "default";
      islandHighContrast = true;
      widgetOutlineEnabled = false;
      shadowIntensity = 0;
      attachToScreenEdge = false;
      island = true;
      islandFloating = false;
      islandUseOverlayLayer = false;
      islandSatelliteBackground = false;
    }
  ];
  desktopClockCustomColor = {
    r = 1;
    g = 1;
    b = 1;
    a = 1;
    hsvHue = -1;
    hsvSaturation = 0;
    hsvValue = 1;
    hslHue = -1;
    hslSaturation = 0;
    hslLightness = 1;
    valid = true;
  };
  systemMonitorCustomColor = {
    r = 1;
    g = 1;
    b = 1;
    a = 1;
    hsvHue = -1;
    hsvSaturation = 0;
    hsvValue = 1;
    hslHue = -1;
    hslSaturation = 0;
    hslLightness = 1;
    valid = true;
  };
  builtInPluginSettings = {
    dms_settings_search = {
      trigger = "?";
    };
    dms_clipboard_search = {
      trigger = "cb";
    };
    dms_power = {
      trigger = "pw";
    };
    dms_qr_generator = {
      trigger = "qrg";
    };
  };
  configVersion = 18;
}

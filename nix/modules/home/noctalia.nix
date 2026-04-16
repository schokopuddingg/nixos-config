{ inputs, ... }:
{
  # https://docs.noctalia.dev/getting-started/nixos/#config-ref
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "../../static/img/wallpapers/cch-stairs.jpg";
      wallpapers = {
        "DP-1" = "../../static/img/wallpapers/cch-stairs.jpg";
      };
    };
  };

  programs.noctalia-shell = {
    enable = true;
    settings = {
      location = {
        name = "";
        weatherEnabled = true;
        weatherShowEffects = true;
        weatherTaliaMascotAlways = false;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = 0;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
        autoLocate = true;
      };
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Noctalia (default)";
        darkMode = true;
      };
      appLauncher = {
        enableClipboardHistory = true;
        enableClipPreview = true;
        clipboardWrapText = true;
        enableClipboardSmartIcons = true;
        enableClipboardChips = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "center";
        pinnedApps = [ ];
        sortByMostUsed = true;
        terminalCommand = "alacritty -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = true;
        iconMode = "tabler";
        showIconBackground = false;
        enableSettingsSearch = true;
        enableWindowsSearch = true;
        enableSessionSearch = true;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
        overviewLayer = false;
        density = "default";
      };
      noctaliaPerformance = {
        disableDesktopWidgets = true;
      };
      sessionMenu = {
        countdownDuration = 3000;
      };
      dock.enabled = false;
      notifications = {
        location = "top_right";
        lowUrgencyDuration = 2;
        normalUrgencyDuration = 4;
        criticalUrgencyDuration = 10;
        enableMarkdown = true;
        saveToHistory = {
          low = false;
          normal = true;
          critical = true;
        };
      };
      bar = {
        position = "top";
        showCapsule = true;
        widgets = {
          left = [
            {
              id = "Launcher";
            }
            {
              id = "Clock";
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "ActiveWindow";
            }
            {
              id = "MediaMini";
            }
          ];
          center = [
            {
              id = "Workspace";
            }
            {
              id = "plugin:privacy-indicator";
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "plugin:tailscale";
            }
            {
              id = "plugin:mirror-mirror";
            }
            {
              id = "plugin:network-manager-vpn";
            }
            {
              id = "Battery";
            }
            {
              id = "Volume";
            }
            {
              id = "Brightness";
            }
            {
              id = "ControlCenter";
            }
            {
              id = "plugin:catwalk";
            }
            {
              id = "plugin:screen-toolkit";
            }
          ];
        };
      };
    };
    plugins = {
      autoUpdate = true;
      notifyUpdates = true;
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        catwalk = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        polkit-agent = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        screen-toolkit = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        network-manager-vpn = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        mirror-mirror = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        privacy-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };

    pluginSettings = {
      catwalk = {
        minimumThreshold = 25;
        # hideBackground = true;
      };
      tailscale = {
      };
    };
  };
}

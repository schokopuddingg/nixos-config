{ inputs, ... }:
{
  # https://docs.noctalia.dev/getting-started/nixos/#config-ref
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "/home/schokopuddingg/nixos-config/nix/static/img/wallpapers/white-pink-logo.png";
      wallpapers = {
        "DP-1" = "/home/schokopuddingg/nixos-config/nix/static/img/wallpapers/white-pink-logo.png";
      };
    };
  };

  programs.noctalia-shell = {
    enable = true;
    settings = {
      general = {
        lockScreenAnimations = true;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = true;
        enableLockScreenMediaControls = true;
        showChangelogOnStartup = false;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
        allowPasswordWithFprintd = true;
        clockStyle = "custom";
        clockFormat = "HH:mm:ss";
        passwordChars = true;
        lockScreenBlur = 1;
      };

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

      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        useOriginalImages = true;
      };

      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Ayu Green";
        schedulingMode = "location";
        syncGsettings = true;
      };

      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = true;
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

      idle = {
        enabled = true;
        screenOffTimeout = 600;
        lockTimeout = 660;
        suspendTimeout = 1800;
        fadeDuration = 5;
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

      osd = {
        enabled = true;
        location = "bottom_center";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 1;
        enabledTypes = [
          0
          1
          2
          3
        ];
        monitors = [ ];
      };

      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "WallpaperSelector";
            }
            {
              id = "NoctaliaPerformance";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
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

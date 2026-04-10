{ inputs, ... }:
{
  # https://docs.noctalia.dev/getting-started/nixos/#config-ref
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      location = {
        name = "Munich, Germany";
        firstDayOfWeek = 0;
      };
      colorSchemes.predefinedScheme = "Rose Pine";
      appLauncher = {
        enableClipboardHistory = true;
        enableClipPreview = true;
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
          ];
        };
      };
    };
    plugins = {
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

{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
{
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md
  # import the home manager module
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    settings = {
      spawn-at-startup = [
        {
          command = [
            (lib.getExe config.programs.noctalia-shell.package)
          ];
        }
      ];

      xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

      input = {
        keyboard = {
          xkb.layout = "de";
        };
        touchpad = {
          tap = true;
          click-method = "clickfinger";
          accel-profile = "flat";
        };
      };

      layout.gaps = 5;

      binds =
        let
          noctalia = action: "${lib.getExe config.programs.noctalia-shell.package} ipc call ${action}";
        in
        {

          "Mod+D".action.spawn-sh = noctalia "launcher toggle";
          "Mod+L".action.spawn-sh = noctalia "lockScreen lock";
          "Mod+Escape".action.spawn-sh = noctalia "sessionMenu toggle";
          "Mod+Shift+V".action.spawn-sh = noctalia "launcher clipboard";
          "Mod+H".action.show-hotkey-overlay = [ ];

          "Mod+Return".action.spawn-sh = lib.getExe pkgs.alacritty;
          "Mod+Q".action.close-window = [ ];

          # --- Standard Niri Keybinds ---

          # mocus column
          "Mod+Left".action.focus-column-left = [ ];
          "Mod+Right".action.focus-column-right = [ ];

          # move windws
          "Mod+WheelScrollDown".action.focus-column-right = [ ];
          "Mod+WheelScrollUp".action.focus-column-left = [ ];

          # move columns
          "Mod+Shift+Left".action.move-column-left = [ ];
          "Mod+Shift+Right".action.move-column-right = [ ];

          # window size
          "Mod+R".action.switch-preset-column-width = [ ];
          "Mod+F".action.maximize-column = [ ];
          "Mod+Shift+F".action.fullscreen-window = [ ];
          "Mod+Alt+Right".action.consume-or-expel-window-right = [ ];
          "Mod+Alt+Left".action.consume-or-expel-window-left = [ ];

          # monitor focus
          "Mod+Page_Up".action.focus-monitor-up = [ ];
          "Mod+Page_Down".action.focus-monitor-down = [ ];

          # tiling
          "Mod+y".action.toggle-window-floating = [ ];
          "Mod+Shift+y".action.toggle-window-floating = [ ];

          # overview
          "Mod+O".action.toggle-overview = [ ];

          # workspace movement
          "Mod+Up".action.focus-workspace-up = [ ];
          "Mod+Down".action.focus-workspace-down = [ ];

          "Mod+Shift+Up".action.move-column-to-workspace-up = [ ];
          "Mod+Shift+Down".action.move-column-to-workspace-down = [ ];

          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;

          "Mod+Ctrl+Right".action.focus-monitor-right = [ ];
          "Mod+Ctrl+Left".action.focus-monitor-left = [ ];
          "Mod+Ctrl+Up".action.focus-monitor-up = [ ];
          "Mod+Ctrl+Down".action.focus-monitor-down = [ ];

          "Mod+Ctrl+Shift+Right".action.move-workspace-to-monitor-right = [ ];
          "Mod+Ctrl+Shift+Left".action.move-workspace-to-monitor-left = [ ];
          "Mod+Ctrl+Shift+Up".action.move-workspace-to-monitor-up = [ ];
          "Mod+Ctrl+Shift+Down".action.move-workspace-to-monitor-down = [ ];

          # screenshot
          "Mod+Shift+S".action.screenshot = [ ];
          "Mod+Shift+Alt+S".action.screenshot-screen = [ ];

          # Quit
          "Mod+Ctrl+Q".action.quit = [ ];
        };
    };
  };

}

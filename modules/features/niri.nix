{ self, inputs, ... }: {

  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
  
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
	spawn-at-startup = [
	  (lib.getExe self'.packages.myNoctalia)
	];

	xwayland-satellite.path =
	  lib.getExe pkgs.xwayland-satellite;

        input = {
  keyboard = {
    xkb.layout = "de";
  };
};

        layout.gaps = 5;

        binds = let
          noctalia = action: "${lib.getExe self'.packages.myNoctalia} ipc call ${action}";
        in {
          
          "Mod+D".spawn-sh = noctalia "launcher toggle";
          "Mod+L".spawn-sh = noctalia "lockScreen lock";
          "Mod+Escape".spawn-sh = noctalia "sessionMenu toggle";
          "Mod+Shift+V".spawn-sh = noctalia "launcher clipboard";
          "Mod+H".show-hotkey-overlay = null;
          
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = null;

          # --- Standard Niri Keybinds ---
          
          # mocus column
          "Mod+Left".focus-column-left = null;
          "Mod+Right".focus-column-right = null;
          
          # move windws
          "Mod+WheelScrollDown".focus-column-right = null;
          "Mod+WheelScrollUp".focus-column-left = null;
          
          # move columns
          "Mod+Shift+Left".move-column-left = null;
          "Mod+Shift+Right".move-column-right = null;

          # window size
          "Mod+R".switch-preset-column-width = null;
          "Mod+F".maximize-column = null;
          "Mod+Shift+F".fullscreen-window = null;

          # monitor focus
          "Mod+Page_Up".focus-monitor-up = null;
          "Mod+Page_Down".focus-monitor-down = null;

          # overview
          "Mod+O".toggle-overview = null;

          # workspace movement
          "Mod+Up".focus-workspace-up = null;
          "Mod+Down".focus-workspace-down = null;

          "Mod+Shift+Up".move-column-to-workspace-up = null;
          "Mod+Shift+Down".move-column-to-workspace-down = null;
          
          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;

          # screenshot
          "Mod+Shift+S".screenshot = null;
          "Mod+Shift+Alt+S".screenshot-screen = null;

          # Quit
          "Mod+Ctrl+Q".quit = null;
        };
    };
    
  };

};

}

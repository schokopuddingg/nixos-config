{ pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./browsers.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable ly
  services.displayManager.ly.enable = true;

  # Enable niri
  programs.niri.enable = true;

  # Niri substituters stuff so no more fully local build yeay
  nix = {
    settings = {
      warn-dirty = false;
      download-buffer-size = 524288000; # 500 MiB
      max-substitution-jobs = 128;
      http-connections = 128;
      max-jobs = "auto";
      substituters = [
        "https://cache.nixos.org"
        "https://niri.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      ];
    };
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [

    # Tools
    cpu-x
    veracrypt
    cryptomator

    # Media
    vlc
    pix
    mpv
    flameshot
  ];
}

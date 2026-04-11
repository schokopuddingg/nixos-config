{ pkgs, ... }:
{
  imports = [
    ./audio.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable ly
  services.displayManager.ly.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = true;

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
    xournalpp
    localsend
    filezilla

    # Media
    vlc
    pix
    mpv
    flameshot
  ];
}

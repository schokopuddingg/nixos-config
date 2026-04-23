{ pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./browsers.nix
    ./fprint.nix
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

  services.xserver.videoDrivers = [ "modesetting" ];

   hardware.graphics = {
     enable = true;
     extraPackages = with pkgs; [
       # Required for modern Intel GPUs (Xe iGPU and ARC)
       intel-media-driver     # VA-API (iHD) userspace
       vpl-gpu-rt             # oneVPL (QSV) runtime

       # Optional (compute / tooling):
       intel-compute-runtime  # OpenCL (NEO) + Level Zero for Arc/Xe
       # NOTE: 'intel-ocl' also exists as a legacy package; not recommended for Arc/Xe.
       # libvdpau-va-gl       # Only if you must run VDPAU-only apps
     ];
   };

   environment.sessionVariables = {
     LIBVA_DRIVER_NAME = "iHD";     # Prefer the modern iHD backend
     # VDPAU_DRIVER = "va_gl";      # Only if using libvdpau-va-gl
   };

   # May help if FFmpeg/VAAPI/QSV init fails (esp. on Arc with i915):
   hardware.enableRedistributableFirmware = true;
   boot.kernelParams = [ "i915.enable_guc=3" ];

   # May help services that have trouble accessing /dev/dri (e.g., jellyfin/plex):
   # users.users.<service>.extraGroups = [ "video" "render" ];


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

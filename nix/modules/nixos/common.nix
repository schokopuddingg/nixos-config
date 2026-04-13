{ pkgs, hostName, ... }:
{
  networking.hostName = hostName;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  home-manager.backupFileExtension = "bac";

  users.users.schokopuddingg = {
    isNormalUser = true;
    description = "Schokopuddingg";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure console keymap
  console.keyMap = "de";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  environment.systemPackages = with pkgs; [

    # Tools
    git
    btop
    unzip
    putty
    bluetuith
    screen
    wget
    rsync
    neovim
    traceroute
    fastfetch

    # Media
    superfile
    ffmpeg
    imagemagick

  ];
}

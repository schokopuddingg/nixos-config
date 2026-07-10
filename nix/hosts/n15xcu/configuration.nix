{ flake, ... }:

{
  imports = [
    ./hardware-configuration.nix
    flake.modules.nixos.common
    flake.modules.nixos.graphical
    flake.modules.nixos.wireless
    flake.modules.nixos.gaming
    flake.modules.nixos.wine
    flake.modules.nixos.gc
    flake.modules.nixos.networking
  ];

  boot.initrd.luks.devices."luks-63309168-4c90-4251-9880-8e1f5c202e7d".device =
    "/dev/disk/by-uuid/63309168-4c90-4251-9880-8e1f5c202e7d";

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}

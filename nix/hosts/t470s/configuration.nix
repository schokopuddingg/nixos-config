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
  ];

  boot.initrd.luks.devices."luks-54a0fdb6-f55a-4eab-bc9d-87658a5bc7ad".device =
    "/dev/disk/by-uuid/54a0fdb6-f55a-4eab-bc9d-87658a5bc7ad";

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}

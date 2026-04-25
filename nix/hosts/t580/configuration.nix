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
    flake.modules.nixos.tailscale
  ];

  boot.initrd.luks.devices."luks-45feae73-f6ff-4c5c-a316-64b15f355fee".device = "/dev/disk/by-uuid/45feae73-f6ff-4c5c-a316-64b15f355fee";
    # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}

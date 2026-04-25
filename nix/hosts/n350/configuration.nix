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

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?

}

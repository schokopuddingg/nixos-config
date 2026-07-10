{ flake, ... }:

{
  imports = [
    ./hardware-configuration.nix
    flake.modules.nixos.common
    flake.modules.nixos.graphical
    flake.modules.nixos.wine
    flake.modules.nixos.gc
    flake.modules.nixos.networking
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}

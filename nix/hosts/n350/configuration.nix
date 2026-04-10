{ flake, ... }:

{
  imports = [
    ./hardware-configuration.nix
    flake.modules.nixos.common
    flake.modules.nixos.graphical
  ];

  # TODO: replace with generated config!!!

  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}

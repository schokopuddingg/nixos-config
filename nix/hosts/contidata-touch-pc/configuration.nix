{ flake, ... }:

{
  imports = [
    ./hardware-configuration.nix
    flake.modules.nixos.common
    flake.modules.nixos.graphical
    flake.modules.nixos.wireless
    flake.modules.nixos.networking
  ];


  # Enable networking
  networking.networkmanager.enable = true;

  system.stateVersion = "26.05"; # Did you read the comment?

}

{ flake, ... }:
{
  imports = [
    flake.homeModules.niri
    flake.homeModules.noctalia
    flake.homeModules.common
    flake.homeModules.dev
  ];

  home.stateVersion = "25.11";
}

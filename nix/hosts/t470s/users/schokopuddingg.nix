{ flake, ... }:
{
  imports = [
    flake.homeModules.niri
    flake.homeModules.noctalia
    flake.homeModules.common
    flake.homeModules.cad
    flake.homeModules.obs
  ];

  home.stateVersion = "25.11";
}

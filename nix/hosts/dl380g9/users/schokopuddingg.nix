{ flake, ... }:
{
  imports = [
    flake.homeModules.niri
    flake.homeModules.noctalia
    flake.homeModules.common
    flake.homeModules.cad
    flake.homeModules.obs
    flake.homeModules.resolve
    flake.homeModules.dev
  ];


  home.stateVersion = "25.11";
}

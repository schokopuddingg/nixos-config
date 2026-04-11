{ flake, ... }:
{
  imports = [
    flake.homeModules.niri
    flake.homeModules.noctalia
    flake.homeModules.common
    flake.homeModules.tex
  ];

  home.stateVersion = "25.11";
}

{ flake, ... }:
{
  imports = [
    flake.homeModules.niri
    flake.homeModules.noctalia
    flake.homeModules.shell
    flake.homeModules.git
    flake.homeModules.media
  ];

  home.stateVersion = "26.05";
}

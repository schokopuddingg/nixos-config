{ pkgs, ... }:
{
  virtualisation.docker.enable = true;

  users.users.schokopuddingg.extraGroups = [ "docker" ];   # temp; need to find out how/where to put that line so that I don't have to have "schokopuddingg" standing there...

  environment.systemPackages = [
    pkgs.winboat
  ];
}

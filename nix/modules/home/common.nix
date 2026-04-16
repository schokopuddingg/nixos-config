{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./git.nix
    ./media.nix
    ./social.nix
    ./office.nix
    ./code.nix
  ];

  home.packages = with pkgs; [

  ];
}

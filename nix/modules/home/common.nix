{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./git.nix
    ./media.nix
    ./social.nix
    ./office.nix
  ];

  home.packages = with pkgs; [

  ];
}

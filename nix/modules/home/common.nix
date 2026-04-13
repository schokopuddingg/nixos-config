{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./media.nix
    ./social.nix
    ./office.nix
  ];

  home.packages = with pkgs; [

  ];
}

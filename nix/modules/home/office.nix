{ pkgs, ... }:
{

imports = [
  ./tex.nix
];

  home.packages = with pkgs; [

    bitwarden-desktop
    libreoffice
    naps2
    vscode
    xournalpp
    filezilla

  ];
}

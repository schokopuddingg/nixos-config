{ pkgs, ... }:
{

  home.packages = with pkgs; [

    spotify
    darktable
    rawtherapee
    gimp
    inkscape
    ardour
    audacity
    freetube
    localsend
    lmms
    picard

  ];
}

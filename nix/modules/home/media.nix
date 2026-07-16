{ pkgs, ... }:
{

  home.packages = with pkgs; [

    spotify
    darktable
    rawtherapee
    gimp
    inkscape
    mastodon
    ardour
    audacity
    freetube
    localsend
    lmms
    picard

  ];
}

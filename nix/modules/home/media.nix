{ pkgs, ... }:
{

  home.packages = with pkgs; [

    spotify
    darktable
    rawtherapee
    gimp
    mastodon
    ardour
    audacity
    freetube
    localsend

  ];
}
